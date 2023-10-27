import "dart:io";
import "package:android_id/android_id.dart";
import "package:device_info_plus/device_info_plus.dart";
import "package:package_info_plus/package_info_plus.dart";

/// Device Info
class DeviceInfo {
  /// Gets devices serial number
  ///
  /// If the serial number can't be retrieved, an exception is thrown.
  static Future<String> getSerialNumber() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String? serialNumber;

    if (Platform.isAndroid) {
      const androidId = AndroidId();
      serialNumber = await androidId.getId();
    }
    if (Platform.isMacOS) {
      serialNumber = (await deviceInfoPlugin.macOsInfo).systemGUID;
    }

    if (serialNumber == null) {
      throw "Couldn't get devices serial number!";
    }

    return serialNumber;
  }

  /// Gets devices softwares version
  static Future<String> getSoftwareVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }
}
