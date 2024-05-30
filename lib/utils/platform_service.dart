import "package:flutter/services.dart";
import "package:simple_logger/simple_logger.dart";

class PlatformService {
  static const _channel =
      MethodChannel("fi.metatavu.noheva_visitor_ui/platform_service");

  static Future<void> setVMDensity(double density) async {
    try {
      SimpleLogger().info("Setting VM density to $density...");
      await _channel.invokeMethod("setVMDensity", {"density": density.round()});
      SimpleLogger().info("VM density set to $density");
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to set VM density: ${e.message}");
    }
  }

  static Future<int?> getVMDensity() async {
    try {
      SimpleLogger().info("Getting VM density...");
      int result = await _channel.invokeMethod("getVMDensity");
      SimpleLogger().info("VM density is $result");
      return result;
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to get VM density: ${e.message}");
      return null;
    }
  }

  static Future<void> restartApp() async {
    try {
      SimpleLogger().info("Restarting Activity...");
      await _channel.invokeMethod("restartAcitivity");
    } on PlatformException catch (e) {
      SimpleLogger().shout("Failed to restart App: ${e.message}");
    }
  }
}
