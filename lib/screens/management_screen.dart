import "dart:async";
import "package:flutter/material.dart";
import "package:noheva_visitor_ui/app_updates/app_updater.dart";
import "dart:core";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:simple_logger/simple_logger.dart";

/// Management Screen
///
/// This screen is used to manage application updates.
class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

/// Management Screen state
class _ManagementScreenState extends State<ManagementScreen> {
  String _currentVersion = "";
  String _serverVersion = "";
  bool _serverVersionResolvingError = false;
  bool _loading = true;
  bool _isMqttConnected = false;
  Timer? _mqttConnectionTimer;

  /// On click handler for button
  Future _handleUpdate() async {
    setState(() => _loading = true);
    try {
      await Updater.updateApp(_serverVersion);
    } catch (e) {
      SimpleLogger().shout("Couldn't update app: $e");
    }
    setState(() => _loading = false);
  }

  /// Checks applications current and available version numbers
  Future _checkVersions() async {
    String currentVersion = await Updater.getCurrentVersion();
    String? serverVersion = await Updater.getServerVersion();

    setState(() {
      _currentVersion = currentVersion;
      _serverVersion = serverVersion ?? "Verkkovirhe";
      _loading = false;
      _serverVersionResolvingError = serverVersion == null;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkVersions();
    setState(() => _isMqttConnected = mqttClient.isConnected);
    _mqttConnectionTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _isMqttConnected = mqttClient.isConnected),
    );
  }

  @override
  void dispose() {
    _mqttConnectionTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: SizedBox(
        width: 200,
        height: 200,
        child: FittedBox(
          child: FloatingActionButton.large(
            child: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Center(
        child: _loading
            ? CircularProgressIndicator(color: Theme.of(context).primaryColor)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .currentVersion(_currentVersion),
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    AppLocalizations.of(context)!
                        .availableVersion(_serverVersion),
                    style: const TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          EdgeInsetsGeometry.lerp(
                            const EdgeInsets.all(20),
                            const EdgeInsets.all(30),
                            0.5,
                          ),
                        ),
                      ),
                      onPressed:
                          _serverVersionResolvingError ? null : _handleUpdate,
                      child: Text(
                        AppLocalizations.of(context)!.installUpdateButton,
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      AppLocalizations.of(context)!.mqttClientConnectionStatus(
                        _isMqttConnected ? "online" : "offline",
                      ),
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}