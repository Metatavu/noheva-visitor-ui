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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
