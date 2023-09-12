import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/theme/theme.dart";
import "package:openapi_generator_annotations/openapi_generator_annotations.dart";
import "package:simple_logger/simple_logger.dart";
import "api/api_factory.dart";
import "config/configuration.dart";
import "database/dao/key_dao.dart";
import "screens/device_setup_screen.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

late final Configuration configuration;
late final String environment;
final apiFactory = ApiFactory();
late bool isDeviceApproved;
String? deviceId;
final StreamController streamController =
    StreamController.broadcast(sync: true);

void main() async {
  _configureLogger();
  SimpleLogger().info("Starting Noheva Visitor UI App...");
  SimpleLogger().info("Loading .env file...");
  await dotenv.load(fileName: ".env");
  SimpleLogger().info("Validating environment variables...");
  configuration = Configuration();

  environment = configuration.getEnvironment();
  SimpleLogger().info("Running in $environment environment");

  deviceId = await keyDao.getDeviceId();

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

  runApp(const MyApp());
}

/// Polls device approval status and cancels [timer] when device is approved.
Future _pollDeviceApprovalStatus(Timer timer) async {
  SimpleLogger().info("Polling device approval status...");
  DevicesApi devicesApi = await apiFactory.getDevicesApi();

  try {
    deviceId = await keyDao.getDeviceId();
    if (deviceId == null) {
      SimpleLogger().info(
          "Device ID not found, cannot poll device status. Waiting for setup...");
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
void _configureLogger({logLevel = Level.INFO}) {
  SimpleLogger().setLevel(logLevel, includeCallerInfo: true);
  SimpleLogger().formatter = ((info) =>
      "[${info.time}] -- ${info.callerFrame ?? "NO CALLER INFO"} - ${info.message}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Noheva visitor UI",
      theme: getApplicationTheme(),
      localizationsDelegates: const [AppLocalizations.delegate],
      home:
          deviceId == null ? const DeviceSetupScreen() : const DefaultScreen(),
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
