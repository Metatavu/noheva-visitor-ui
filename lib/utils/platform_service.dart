import "dart:io";
import "package:flutter/services.dart";
import "package:simple_logger/simple_logger.dart";

/// Platform Service
///
/// This class provides a set of platform specific services.
///
/// At the moment only Android is supported.
class PlatformService {
  static const _methodChannelName =
      "fi.metatavu.noheva_visitor_ui/platform_service";
  static const _setWMDensityMethod = "setWMDensity";
  static const _getWMDensityMethod = "getWMDensity";
  static const _restartActivityMethod = "restartActivity";
  static const _setWMDensityArgument = "density";
  static const _channel = MethodChannel(_methodChannelName);

  /// Sets VM density to [density]
  static Future<void> setWMDensity(double density) async {
    if (!Platform.isAndroid) {
      SimpleLogger()
          .warning("Attempted to set WM density on non-Android platform");
      return;
    }
    try {
      await _channel.invokeMethod(
          _setWMDensityMethod, {_setWMDensityArgument: density.round()});
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to set WM density: ${e.message}");
    }
  }

  /// Gets the current WM density
  static Future<int?> getWMDensity() async {
    if (!Platform.isAndroid) {
      SimpleLogger()
          .warning("Attempted to get WM density on non-Android platform");
      return null;
    }
    try {
      return await _channel.invokeMethod(_getWMDensityMethod);
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to get current WM density: ${e.message}");
      return null;
    }
  }

  /// Restarts the app
  ///
  /// This method restarts the app by restarting the activity.
  /// It is necessary to restart the activity after changing the WM density.
  static Future<void> restartApp() async {
    if (!Platform.isAndroid) {
      SimpleLogger()
          .warning("Attempted to restart activity on non-Android platform");
      return;
    }
    try {
      await _channel.invokeMethod(_restartActivityMethod);
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to restart activity: ${e.message}");
    }
  }
}
