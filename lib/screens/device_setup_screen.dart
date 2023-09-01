import "package:flutter/material.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/keys_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/mqtt/mqtt_client.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/utils/device_info.dart";
import "package:simple_logger/simple_logger.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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

  void _navigateToDefaultScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DefaultScreen(),
      ),
    );
  }

  Future _createDevice(DeviceRequest deviceRequest) async {
    DevicesApi devicesApi = await apiFactory.getDevicesApi();
    try {
      Device createdDevice =
          (await devicesApi.createDevice(deviceRequest: deviceRequest)).data!;
      SimpleLogger().info("Created device: $createdDevice");
      await keysDao.storeDeviceId(createdDevice.id!);
      SimpleLogger().info("Connecting MQTT client...");
      await mqttClient.connect(createdDevice.id!);
      _navigateToDefaultScreen();
    } catch (exception) {
      SimpleLogger().shout("Error creating device: $exception");
    }
  }

  Future _submitForm() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    DeviceRequest deviceRequest = await _buildDeviceRequest(
      name: name,
      description: description,
    );
    _createDevice(deviceRequest);
  }

  Future _skipSetup() async {
    DeviceRequest deviceRequest = await _buildDeviceRequest();
    _createDevice(deviceRequest);
  }

  Future<DeviceRequest> _buildDeviceRequest({name, description}) async {
    String version = (await PackageInfo.fromPlatform()).version;
    String? serialNumber = await DeviceInfo.getSerialNumber();

    if (serialNumber == null) {
      throw "Serial number not found";
    }
    ;

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
      backgroundColor: const Color(0xffFCF7F7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppLocalizations.of(context)!.deviceSetupTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xff231F20),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context)!.deviceSetupNameLabel,
                    ),
                    cursorColor: const Color(0xff231F20),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .deviceSetupDescriptionLabel,
                    ),
                    cursorColor: const Color(0xff231F20),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text(AppLocalizations.of(context)!
                            .deviceSetupSubmitButton),
                      ),
                      ElevatedButton(
                        onPressed: _skipSetup,
                        child: Text(AppLocalizations.of(context)!
                            .deviceSetupSkipButton),
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