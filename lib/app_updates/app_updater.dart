import "dart:convert";
import "dart:io";
import "package:flutter_app_installer/flutter_app_installer.dart";
import "package:collection/collection.dart";
import "package:noheva_visitor_ui/app_updates/models/output_metadata.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:path_provider/path_provider.dart";
import "package:simple_logger/simple_logger.dart";
import "package:typed_data/typed_data.dart";
import "../main.dart";
import "../utils/offline_file_controller.dart";

/// App updater
class Updater {
  /// Gets applications current version number
  static Future<String> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return packageInfo.version;
  }

  /// Gets latest version from the server
  static Future<String?> getServerVersion() async {
    try {
      SimpleLogger().info("Checking version available on server...");
      if (Platform.isAndroid) {
        return await _getAndroidServerVersion();
      } else if (Platform.isMacOS) {
        SimpleLogger().warning("MacOS app updating is handled via Sparkle.");
      }
    } catch (exception) {
      SimpleLogger().warning("Couldn't get version from server: $exception");
    }
    return null;
  }

  /// Gets latest Android version from the server
  static Future<String?> _getAndroidServerVersion() async {
    Int8Buffer fileContent = await _doRequest("/android/output-metadata.json");
    OutputMetadata outputMetadata =
        OutputMetadata.fromJson(jsonDecode(utf8.decode(fileContent)));
    String? foundVersion = outputMetadata.elements.firstOrNull?.versionName;

    return foundVersion;
  }

  /// Updates the app to [version]
  static Future<void> updateApp(String version) async {
    if (Platform.isAndroid) {
      await _updateAndroidApp(version);
    } else if (Platform.isMacOS) {
      SimpleLogger().warning(
        "Attempted to invoke AppUpdater::updateApp on MacOS. This is not supported.",
      );
    }
  }

  /// Updates the Android app to [version]
  static Future<void> _updateAndroidApp(String version) async {
    SimpleLogger().info("Downloading new version...");
    Int8Buffer fileContent =
        await _doRequest("/android/$version/app-release.apk");
    String? storageDir = (await getExternalStorageDirectory())?.absolute.path;
    File apkFile = File("$storageDir/fi.metatavu.noheva_visitor_ui.apk");

    SimpleLogger().info("Creating new .apk file...");

    if (await apkFile.exists()) {
      await apkFile.delete();
    }
    await apkFile.create();

    SimpleLogger().info("Writing content to the .apk file...");
    await apkFile.writeAsBytes(fileContent);

    SimpleLogger().info("Installing the new .apk file...");
    FlutterAppInstaller appInstaller = FlutterAppInstaller();
    await appInstaller.installApk(
      filePath: apkFile.path,
      silently: false,
    );
    SimpleLogger().info("Installed!");
  }

  /// Does HTTP request to given [url] and return the response as ByteArray
  static Future<Int8Buffer> _doRequest(String url) async {
    String appUpdatesBaseUrl = configuration.getAppUpdatesBaseUrl();
    Uri uri = Uri.parse((appUpdatesBaseUrl + url).replaceAll("\n", ""));
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();

    return await offlineFileController.readResponseToBytes(response);
  }
}
