import "package:flutter/material.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/utils/device_info.dart";
import "package:simple_logger/simple_logger.dart";
import "package:package_info_plus/package_info_plus.dart";

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

  Future _submitForm() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    SimpleLogger().info(await _buildDeviceRequest(
      name: name,
      description: description,
    ));
  }

  Future _skipSetup() async {
    SimpleLogger().info("Set up device on management UI");
    SimpleLogger().info(await _buildDeviceRequest());
    // TODO: API request/ change screen
  }

  Future<DeviceRequest?> _buildDeviceRequest({name, description}) async {
    String version = (await PackageInfo.fromPlatform()).version;
    String? serialNumber = await DeviceInfo.getSerialNumber();

    if (serialNumber == null) return null;

    return DeviceRequest((builder) {
      builder.name = name;
      builder.description = description;
      builder.serialNumber = serialNumber;
      builder.version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Device setup"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: "Name"),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: "Description"),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text("Submit"),
                      ),
                      ElevatedButton(
                        onPressed: _skipSetup,
                        child: const Text("Skip setup"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
