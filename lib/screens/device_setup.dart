import "package:flutter/material.dart";
import "package:simple_logger/simple_logger.dart";

/// Device Setup Screen
class DeviceSetupScreen extends StatefulWidget {
  const DeviceSetupScreen({super.key});

  @override
  State<DeviceSetupScreen> createState() => _DeviceSetupState();
}

/// Device Setup Screen state
class _DeviceSetupState extends State<DeviceSetupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // TODO: Get this value from Device DB
  final _isApprovedDevice = false;
  // bool _isApprovedDevice = false;

  void _submitForm() {
    String name = _nameController.text;
    String description = _descriptionController.text;

    // TODO: Should post to API
    SimpleLogger().info('Name: $name');
    SimpleLogger().info('Description: $description');
  }

  void _skipSetup() {
    SimpleLogger().info("Set up device on management screen");
    // TODO: API request/ change screen
  }

  // TODO: Navigate to where is already approved
  // / Navigates to [] if device is approved and ...
  // Future _navigateToSurveyScreen(BuildContext context, Survey survey) async {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => SurveyScreen(survey: survey),
  //     ),
  //   ).then((_) => _setupTimers());
  // }

  // TODO:
  // / Polls database with 10 second interval to check if device is approved.
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

  /// TODO: Set up timer for checking if device is approved.
  // Future _setupTimers() async {
  //   logger.info("Initializing default screen timers...");
  //   await _checkDeviceApproval();
  //   await _pollActiveSurvey();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // _setupTimers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!_isApprovedDevice)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed: _skipSetup,
                          child: const Text('Management setup'),
                        ),
                      ],
                    ),
                  )
                else
                  // TODO: If Approved navigate somewhere else
                  const Text("Approved"),
                // setupWidget here
                // Text(
                // AppLocalizations.of(context)!.notYetApproved,
                // style: const TextStyle(
                //   fontFamily: "S-Bonus-Regular",
                //   color: Color(0xffffffff),
                //   fontSize: 50,
                // ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
