import "dart:convert";
import "dart:typed_data";
import "package:mqtt_client/mqtt_client.dart";
import "package:mqtt_client/mqtt_server_client.dart";
import "package:noheva_visitor_ui/mqtt/model/status_message.dart";
import "package:simple_logger/simple_logger.dart";
import "package:typed_data/typed_buffers.dart";
import "../main.dart";
import "../utils/device_info.dart";

/// MQTT Client
class MqttClient {
  String? _deviceId;
  MqttServerClient? _client;

  Future<String> get _statusTopic async {
    var deviceId = _deviceId;

    if (deviceId == null) {
      SimpleLogger().warning("Device ID not found, cannot get status topic.");

      return "";
    }

    return "noheva/$environment/$deviceId/status";
  }

  bool get isConnected =>
      _getClientConnectionStatus() == MqttConnectionState.connected.name;

  Map<String, Function(String)> listeners = {};

  /// Connects MQTT server using [deviceId] as client id if not already connected.
  Future<void> connect(String deviceId) async {
    _deviceId = deviceId;
    var client = _initializeClient(deviceId);

    var mqttUsername = configuration.getMqttUsername();
    var mqttPassword = configuration.getMqttPassword();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      SimpleLogger().info("MQTT Client already connected");

      return;
    }

    if (await DeviceInfo.getSerialNumber() == null) {
      SimpleLogger().warning("Device ID not found, cannot connect to MQTT.");

      return;
    }

    client.logging(on: false);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;

    final connMessage = MqttConnectMessage()
        .keepAliveFor(60)
        .withWillTopic(await _statusTopic)
        .withWillMessage(jsonEncode((await _buildStatusMessage(false))))
        .authenticateAs(mqttUsername, mqttPassword)
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;
    try {
      await client.connect(
        mqttUsername,
        mqttPassword,
      );
    } catch (exception) {
      SimpleLogger().shout("Exception while connecting MQTT Client: $exception");
      client.disconnect();
    }

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      if (messages.isEmpty) {
        return;
      }

      if (listeners.containsKey(messages[0].topic)) {
        SimpleLogger().info("Handling message to ${messages[0].topic}...");
        final MqttPublishMessage publishMessage =
            messages[0].payload as MqttPublishMessage;
        String message = MqttPublishPayload.bytesToStringAsString(
            publishMessage.payload.message);
        listeners[messages[0].topic]!(message);
      } else {
        SimpleLogger()
            .warning("Didn't have listener for topic ${messages[0].topic}");
      }
    });
  }

  /// Handler for successful connections event.
  ///
  /// Sends status message to status topic
  Future onConnected() async {
    StatusMessage? statusMessage = await _buildStatusMessage(true);

    if (statusMessage == null) {
      SimpleLogger()
          .info("Device not yet registered, not sending status message!");

      return;
    }

    SimpleLogger().info("Connected, sending status message...");
    publishMessage(
      await _statusTopic,
      createMessagePayload(jsonEncode(statusMessage)),
    );
  }

  /// Handler for disconnection event.
  ///
  /// Attempts to reconnect the client.
  void onDisconnected() {
    SimpleLogger().info("MQTT Client disconnected");
    _reconnect();
  }

  /// Handler for subscribed to topic events.
  void onSubscribed(String topic) {
    SimpleLogger().info("Subscribed to topic: $topic");
  }

  /// Handler for failing to subscribe to topic events.
  void onSubscribeFail(String topic) {
    SimpleLogger().info("Failed to subscribe to: $topic");
  }

  /// Handler for unsubscribing from topic events.
  void onUnsubscribed(String? topic) {
    SimpleLogger().info("Unsubscribed from topic: $topic");
  }

  /// Disconnects MQTT Client
  void disconnect() {
    SimpleLogger().info("Disconnecting MQTT Client...");
    _client?.disconnect();
  }

  /// Publishes given MQTT [message] to given [topic].
  ///
  /// If client is not connected, attempts to reconnect.
  void publishMessage(String topic, Uint8Buffer message) async {
    if (_client?.connectionStatus == null) return;
    if (_getClientConnectionStatus() != MqttConnectionState.connected.name) {
      await _reconnect();
    }

    _client?.publishMessage(topic, MqttQos.atLeastOnce, message);
  }

  /// Creates MQTT Message payload from [payload]
  Uint8Buffer createMessagePayload(String payload) {
    Uint8List data = Uint8List.fromList(payload.codeUnits);
    Uint8Buffer buffer = Uint8Buffer();
    buffer.addAll(data);

    return buffer;
  }

  /// Subscribes to given MQTT [topic].
  ///
  /// Quality of Service (QoS) defaults to [MqttQos.atLeastOnce] (1)
  void subscribeToTopic(String topic, {qos = MqttQos.atLeastOnce}) {
    _client?.subscribe(topic, qos);
  }

  /// Subscribes to topics listed in [newListeners] and adds topic:callback pairs to [listeners] for further callback invocation.
  void addListeners(Map<String, Function(String)> newListeners) {
    for (var listener in newListeners.entries) {
      subscribeToTopic(listener.key);
      listeners[listener.key] = listener.value;
    }
  }

  /// Sends [StatusMessage]
  Future sendStatusMessage(bool status) async {
    StatusMessage? statusMessage = await _buildStatusMessage(status);

    if (statusMessage == null) {
      SimpleLogger()
          .warning("Device not yet registered, cannot send status message.");

      return;
    }

    String statusTopic = await _statusTopic;

    publishMessage(
      statusTopic,
      createMessagePayload(jsonEncode(statusMessage)),
    );
    SimpleLogger().info("Sent status message to topic: $statusTopic");
  }

  /// Initializes MQTT Client using [deviceId] as client ID.
  ///
  /// Returns initialized MQTT Client.
  MqttServerClient _initializeClient(String deviceId) {
    if (_client != null) {
      return _client!;
    }

    var mqttBasePath = configuration.getMqttUrl();
    var mqttPort = int.tryParse(configuration.getMqttPort());
    _client = MqttServerClient.withPort(mqttBasePath, deviceId, mqttPort!);

    return _client!;
  }

  /// Builds [StatusMessage]
  Future<StatusMessage?> _buildStatusMessage(
    bool status,
  ) async {
    String? deviceId = _deviceId;

    if (deviceId == null) {
      SimpleLogger()
          .warning("Device ID not found, cannot send status message.");

      return null;
    }

    return StatusMessage(
      status: status ? "ONLINE" : "OFFLINE",
      deviceId: deviceId,
    );
  }

  /// Reconnects MQTT Client.
  Future<void> _reconnect({failureCount = 0}) async {
    SimpleLogger().info("Attempting to reconnect MQTT Client...");
    try {
      await _client?.connect();
    } catch (exception) {
      await _awaitDelay(30);
      _reconnect(failureCount: failureCount + 1);
    }
  }

  /// Delays for given [delay] seconds.
  Future<void> _awaitDelay(int delay) async {
    return Future.delayed(Duration(seconds: delay));
  }

  /// Gets MQTT Client connection status string.
  String _getClientConnectionStatus() {
    var client = _client;
    if (client == null) {
      return MqttConnectionState.disconnected.name;
    }

    if (client.connectionStatus == null) {
      return MqttConnectionState.faulted.name;
    }

    return client.connectionStatus!.state.name;
  }
}

final mqttClient = MqttClient();