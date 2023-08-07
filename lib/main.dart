import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:openapi_generator_annotations/openapi_generator_annotations.dart";
import "package:simple_logger/simple_logger.dart";
import "api/api_factory.dart";
import "config/configuration.dart";
import "database/dao/keys_dao.dart";
import 'screens/device_setup_screen.dart';
import "utils/device_info.dart";

late final Configuration configuration;
late final String environment;
final apiFactory = ApiFactory();
late String? hasDeviceId;

void main() async {
  _configureLogger();

  SimpleLogger().info("Starting OSS Surveys Customer App...");

  SimpleLogger().info("Loading .env file...");
  await dotenv.load(fileName: ".env");
  SimpleLogger().info("Validating environment variables...");
  configuration = Configuration();

  environment = configuration.getEnvironment();
  SimpleLogger().info("Running in $environment environment");

  SimpleLogger().info("Connecting to MQTT broker...");

  await _initializeMqttClient();

  SimpleLogger().info("Checking if device has Id...");
  // TODO: Currently will always be null
  hasDeviceId = await keysDao.getDeviceId();

  SimpleLogger().info("Device Id is: $hasDeviceId");

  runApp(const MyApp());
}

void _initPeriodicStatusMessage() {
  Timer.periodic(const Duration(seconds: 30), (_) {
    if (mqttClient.isConnected) {
      mqttClient.sendStatusMessage(true);
    }
  });
}

Future<void> _initializeMqttClient() async {
  final String? serialNumber = await DeviceInfo.getSerialNumber();

  if (serialNumber == null) {
    SimpleLogger()
        .warning("Device serial number not found, cannot connect to MQTT.");

    return;
  } else {
    SimpleLogger().info("Serial number: $serialNumber");
    await mqttClient.connect(serialNumber);
    _initPeriodicStatusMessage();
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Change this to idle screen
      home: hasDeviceId != null
          ? const DefaultScreen(title: "Noheva visitor UI Home Page")
          : const DeviceSetupScreen(),
    );
  }
}

/// API Client generator config
@Openapi(
    additionalProperties: AdditionalProperties(pubName: "noheva_api"),
    inputSpecFile: "noheva-api-spec/swagger.yaml",
    generatorName: Generator.dio,
    outputDirectory: "noheva-api")
class NohevaApi extends OpenapiGeneratorConfig {}
