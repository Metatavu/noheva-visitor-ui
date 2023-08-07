import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key, required this.title});

  final String title;

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  // TODO: Implement when API is ready
  // bool _isApprovedDevice = false;

  //   /// Polls database with 10 second interval to check if device is approved.
  // Future _checkDeviceApproval() async {
  //   bool isApproved = await keysDao.isDeviceApproved();
  //   if (!isApproved) {
  //     Timer.periodic(const Duration(seconds: 10), (timer) async {
  //       logger.info("Checking if device is approved...");
  //       if (await keysDao.isDeviceApproved()) {
  //         logger.info("Device was approved, canceling timer.");
  //         timer.cancel();
  //         setState(() => _isApprovedDevice = true);
  //       }
  //     });
  //   } else {
  //     setState(() => _isApprovedDevice = true);
  //   }
  // }

  // TODO: Navigate to next screen on approval
  // / Navigates to [] if device is approved and ...
  // Future _navigateToSurveyScreen(BuildContext context, Survey survey) async {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SurveyScreen(survey: survey),
  //     ),
  //   ).then((_) => _setupTimers());
  // }

  /// TODO: Set up timer for checking if device is approved.
  // Future _setupTimers() async {
  //   SimpleLogger().info("Initializing device setup screen timers...");
  //   // await _checkDeviceApproval();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _setupTimers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Default screen",
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
