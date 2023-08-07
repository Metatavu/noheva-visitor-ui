import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:openapi_generator_annotations/openapi_generator_annotations.dart";
import "package:simple_logger/simple_logger.dart";
import "api/api_factory.dart";
import "config/configuration.dart";
import "screens/device_setup.dart";
import "utils/device_info.dart";

late final Configuration configuration;
late final String environment;
final apiFactory = ApiFactory();

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
      home: const MyHomePage(title: "Noheva visitor UI Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _pong = "";

  /// Navigates to [DeviceSetupScreen].
  Future _navigateToSetupScreen(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DeviceSetupScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "You have pushed the button this many times:",
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
                onPressed: () async {
                  apiFactory.getSystemApi().then(
                        (api) => api.ping().then((value) {
                          setState(() => _pong = value.toString());
                          Timer.periodic(const Duration(seconds: 10), (_) {
                            setState(() => _pong = "");
                          });
                        }),
                      );
                },
                child: const Text(
                  "ping",
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
            Text(
              _pong,
              style: const TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsetsGeometry.lerp(
                    const EdgeInsets.all(20),
                    const EdgeInsets.all(30),
                    0.5,
                  ),
                ),
              ),
              onPressed: () async {
                SimpleLogger().info("navigate");
                await _navigateToSetupScreen(context);
              },
              child: const Text(
                "Navigate",
                style: TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
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
