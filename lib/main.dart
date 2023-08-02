import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:openapi_generator_annotations/openapi_generator_annotations.dart";
import "package:simple_logger/simple_logger.dart";
import "api/api_factory.dart";
import "config/configuration.dart";

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

  runApp(const MyApp());
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
                          Timer.periodic(const Duration(seconds: 5), (_) {
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
