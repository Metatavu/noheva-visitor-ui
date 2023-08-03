import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:simple_logger/simple_logger.dart';

class DeviceInfo {
  static Future<String?> getSerialNumber() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      const androidId = AndroidId();
      String? deviceId = await androidId.getId();

      if (deviceId == null) {
        SimpleLogger().warning("Device ID not found, cannot connect to MQTT.");

        return null;
      }

      return deviceId;
    }
    if (Platform.isMacOS) {
      return (await deviceInfoPlugin.macOsInfo).systemGUID;
    }

    return null;
  }
}
