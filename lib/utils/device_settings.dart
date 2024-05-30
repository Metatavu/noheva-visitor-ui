import "dart:io";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/key_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/utils/platform_service.dart";
import "package:simple_logger/simple_logger.dart";

/// Device Settings
///
/// Noheva Visitor UI devices can be configured remotely from the management UI.
/// This class is responsible for applying device settings received from the server.
class DeviceSettings {
  /// Applies device settings
  ///
  /// This method loads device settings from the server and applies them to the device.
  /// If the device settings are empty, the method returns without doing anything.
  ///
  /// At the moment device settings are only supported on Android.
  static Future<void> applyDeviceSettings() async {
    if (!Platform.isAndroid) {
      SimpleLogger().info("Device settings are only supported on Android");
      return;
    }
    try {
      final deviceSettings = await _loadDeviceSettings();
      SimpleLogger().info("Applying device settings...");

      if (deviceSettings.isEmpty) {
        SimpleLogger().info("No device settings to apply");
        return;
      }

      SimpleLogger().info("Received device settings: $deviceSettings");
      for (final setting in deviceSettings) {
        await _applyDeviceSetting(setting);
      }
    } catch (e) {
      SimpleLogger().info("Failed to apply device settings: $e");
    }
  }

  /// Applies a device [setting]
  static Future<void> _applyDeviceSetting(DeviceSetting setting) async {
    SimpleLogger().info("Applying setting: ${setting.key}");
    switch (setting.key) {
      case DeviceSettingKey.SCREEN_DENSITY:
        {
          await _applyScreenDensitySetting(setting);
          break;
        }
      default:
        SimpleLogger().info("Unknown setting: ${setting.key}");
    }
  }

  /// Applies screen density [setting]
  static Future<void> _applyScreenDensitySetting(DeviceSetting setting) async {
    final newDensity = double.parse(setting.value);
    SimpleLogger().info("Getting current WM density...");
    final currentDensity = await PlatformService.getWMDensity();
    SimpleLogger().info("Current WM density is $currentDensity");
    if (currentDensity != newDensity) {
      SimpleLogger().info("Setting WM density to $newDensity...");
      await PlatformService.setWMDensity(newDensity);
      SimpleLogger().info("WM density set to $newDensity");
      SimpleLogger().info("Restarting activity...");
      await PlatformService.restartApp();
    } else {
      SimpleLogger().info("WM density is already set to $newDensity");
    }
  }

  /// Loads device settings from the server
  ///
  /// If the device ID is not found (e.g. the device has not been setup), the method returns an empty list.
  static Future<List<DeviceSetting>> _loadDeviceSettings() async {
    SimpleLogger().info("Loading device settings from server...");
    final deviceId = await keyDao.getDeviceId();
    if (deviceId == null) {
      SimpleLogger().info("Device ID is null, cannot load device settings");
      return [];
    }
    final deviceDataApi = await apiFactory.getDeviceDataApi();
    final deviceSettings = await deviceDataApi
        .listDeviceDataSettings(deviceId: deviceId)
        .then((value) => value.data);

    return deviceSettings?.toList() ?? [];
  }
}
