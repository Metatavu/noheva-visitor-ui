import "dart:async";
import "dart:io";
import "dart:ui";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/screens/startup_screen.dart";
import "package:noheva_visitor_ui/theme/font_helper.dart";
import "package:noheva_visitor_ui/theme/theme.dart";
import "package:noheva_visitor_ui/utils/device_info.dart";
import "package:noheva_visitor_ui/utils/timed_tick_counter.dart";
import "package:openapi_generator_annotations/openapi_generator_annotations.dart";
import "package:simple_logger/simple_logger.dart";
import "package:window_manager/window_manager.dart";
import "api/api_factory.dart";
import "config/configuration.dart";
import "database/dao/key_dao.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

late final Configuration configuration;
late final String environment;
late final String mqttBaseTopic;

final apiFactory = ApiFactory();
late bool isDeviceApproved;
String? deviceId;
final managementButtonTickCounter = TimedTickCounter(
  ticksRequired: 10,
  timeout: const Duration(seconds: 5),
  onTicksReached: () => eventBus.fire(OpenManagementScreenEvent()),
);

Future<void> _setAndroidImmersiveMode() async {
  if (Platform.isAndroid) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }
}

void main() async {
  _configureLogger();

  SimpleLogger().info("Starting Noheva Visitor UI App...");

  WidgetsFlutterBinding.ensureInitialized();
  AppLifecycleListener(onExitRequested: _onAppExitRequested);

  SimpleLogger().info("Setting up window manager...");
  _setupWindowManager();
  _setAndroidImmersiveMode();
  SystemChrome.setSystemUIChangeCallback(
    (bool visible) async =>
        Timer(const Duration(seconds: 3), _setAndroidImmersiveMode),
  );

  SimpleLogger().info("Loading .env file...");
  await dotenv.load(fileName: ".env");
  SimpleLogger().info("Validating environment variables...");
  configuration = Configuration();

  environment = configuration.getEnvironment();
  SimpleLogger().info("Running in $environment environment");

  mqttBaseTopic = configuration.getMqttBaseTopic();
  SimpleLogger().info("Using MQTT base topic $mqttBaseTopic");

  final serialNumber = await DeviceInfo.getSerialNumber();
  SimpleLogger().info("Device serial number: $serialNumber");

  deviceId = await keyDao.getDeviceId();

  await _checkInternetConnection();
  await _pingNohevaApi();

  FontHelper.loadOfflinedFonts();

  if (deviceId != null) {
    SimpleLogger().info("Device Id is: $deviceId");
    SimpleLogger().info("Connecting to MQTT broker...");
    await mqttClient.connect(deviceId!);
  } else {
    SimpleLogger().info("Device ID not found, cannot connect to MQTT.");
  }

  SimpleLogger().info("Checking if device is approved...");
  isDeviceApproved = await keyDao.checkIsDeviceApproved();

  if (isDeviceApproved) {
    SimpleLogger().info("Device is approved");
  } else {
    SimpleLogger().info("Device is not yet approved");
    Timer.periodic(
      const Duration(seconds: 30),
      (timer) => _pollDeviceApprovalStatus(timer),
    );
  }

  runApp(const NohevaApp());
}

/// Checks if internet connection is available.
///
/// If not, waits for 5 seconds and retries.
/// This essentially halts the app until internet connection is available.
Future<void> _checkInternetConnection() async {
  SimpleLogger().info("Checking internet connection...");
  try {
    final apiHost = configuration.getApiBasePath().replaceAll("https://", "");
    final lookup = await InternetAddress.lookup(apiHost);
    if (lookup.isNotEmpty && lookup[0].rawAddress.isNotEmpty) {
      SimpleLogger().info("Internet connection is available!");

      return;
    } else {
      SimpleLogger().info("No internet connection!");
      await Future<void>.delayed(const Duration(seconds: 5));
      await _checkInternetConnection();
    }
  } on SocketException catch (exception) {
    SimpleLogger().info("No internet connection: $exception");
    await Future<void>.delayed(const Duration(seconds: 5));
    await _checkInternetConnection();
  } catch (exception) {
    SimpleLogger().info("Error checking internet connection: $exception");
    await Future<void>.delayed(const Duration(seconds: 5));
    await _checkInternetConnection();
  }
}

/// Checks if Noheva API ping endpoint responds correctly
///
/// If not, waits for 5 seconds and retries.
/// This essentially halts the app until the API is available.
Future<void> _pingNohevaApi() async {
  SimpleLogger().info("Pinging Noheva API...");
  try {
    final systemApi = await apiFactory.getSystemApi();

    final pingResponse =
        await systemApi.ping().then((response) => response.data);
    if (pingResponse != null && pingResponse.asString == "pong") {
      SimpleLogger().info("Noheva API is available!");

      return;
    } else {
      SimpleLogger().info("Noheva API is not available!");
      await Future<void>.delayed(const Duration(seconds: 5));
      await _pingNohevaApi();
    }
  } catch (exception) {
    SimpleLogger().info("Error pinging Noheva API: $exception");
    await Future<void>.delayed(const Duration(seconds: 5));
    await _pingNohevaApi();
  }
}

/// Sets up window manager for platforms where it is required and supported.
void _setupWindowManager() async {
  if (Platform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      windowButtonVisibility: false,
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      fullScreen: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.maximize();
    });
  } else {
    SimpleLogger().info("Not running on macOS, skipping window manager setup!");
  }
}

/// Polls device approval status and cancels [timer] when device is approved.
Future<void> _pollDeviceApprovalStatus(Timer timer) async {
  SimpleLogger().info("Polling device approval status...");
  DevicesApi devicesApi = await apiFactory.getDevicesApi();

  try {
    deviceId = await keyDao.getDeviceId();
    if (deviceId == null) {
      SimpleLogger().info(
        "Device ID not found, cannot poll device status. Waiting for setup...",
      );
    } else {
      String? deviceKey = await devicesApi
          .getDeviceKey(deviceId: deviceId!)
          .then((response) => response.data?.key);
      if (deviceKey != null) {
        SimpleLogger().info("Device is approved. Storing device key...");
        await keyDao.storeDeviceKey(deviceKey);
        isDeviceApproved = true;
        SimpleLogger().info("Stored device key, stopping polling!");
        timer.cancel();
      }
    }
  } catch (exception) {
    SimpleLogger().info("Error: $exception");
  }
}

/// Configures logger to use [logLevel] and formats log messages to be cleaner than by default.
void _configureLogger({Level logLevel = Level.INFO}) {
  SimpleLogger().setLevel(logLevel, includeCallerInfo: true);
  SimpleLogger().formatter = ((info) =>
      "[${info.time}] -- ${info.callerFrame ?? "NO CALLER INFO"} - ${info.message}");
}

/// Callback function for when App exit is requested.
///
/// e.g. user clicks on close button
/// Disconnects MQTT client and sends appropriate status message
Future<AppExitResponse> _onAppExitRequested() async {
  SimpleLogger().info("App exit requested, disconnecting MQTT...");
  await mqttClient.disconnect();
  return AppExitResponse.exit;
}

/// Handler for management button click
void _addManagementButtonOverlay(BuildContext context) {
  return Overlay.of(context).insert(
    OverlayEntry(
      builder: (context) => Positioned(
        left: MediaQuery.of(context).size.width / 3,
        top: 0,
        width: 200,
        height: 100,
        child: SizedBox(
          width: 200,
          height: 100,
          child: TextButton(
            onPressed: () => managementButtonTickCounter.tick(),
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.transparent),
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
            ),
            child: const SizedBox(),
          ),
        ),
      ),
    ),
  );
}

class NohevaApp extends StatelessWidget {
  const NohevaApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    SimpleLogger().info(
        "Building main with size (width: ${screenSize.width}, height: ${screenSize.height})...");

    return MaterialApp(
      title: "Noheva visitor UI",
      theme: getApplicationTheme(),
      localizationsDelegates: const [AppLocalizations.delegate],
      home: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback(
              (_) => _addManagementButtonOverlay(context));
          return const StartupScreen();
        },
      ),
    );
  }
}

/// API Client generator config
@Openapi(
  additionalProperties: AdditionalProperties(pubName: "noheva_api"),
  inputSpecFile: "noheva-api-spec/swagger.yaml",
  generatorName: Generator.dio,
  outputDirectory: "noheva-api",
)
class NohevaApi extends OpenapiGeneratorConfig {}
