import "dart:convert";
import "dart:io";
import "package:archive/archive_io.dart";
import "package:flutter_app_installer/flutter_app_installer.dart";
import "package:collection/collection.dart";
import "package:noheva_visitor_ui/app_updates/models/output_metadata.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:path_provider/path_provider.dart";
import "package:simple_logger/simple_logger.dart";
import "package:typed_data/typed_data.dart";
import "package:url_launcher/url_launcher.dart";
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
        return _getMacOsServerVersion();
      }
    } catch (exception) {
      SimpleLogger().warning("Couldn't get version from server: $exception");
    }
    return null;
  }

  /// Gets latest MacOS version from the server
  static Future<String?> _getMacOsServerVersion() async {
    Int8Buffer fileContent = await _doRequest("/macos/version.txt");

    return utf8.decode(fileContent);
  }

  /// Gets latest Android version from the server
  static Future<String?> _getAndroidServerVersion() async {
    Int8Buffer fileContent = await _doRequest("/android/output-metadata.json");
    OutputMetadata outputMetadata =
        OutputMetadata.fromJson(jsonDecode(utf8.decode(fileContent)));
    String? foundVersion = outputMetadata.elements
        .firstWhereOrNull((element) =>
            element.filters.first.value ==
            configuration.getAndroidArchitecture())
        ?.versionName;

    return foundVersion;
  }

  /// Updates the app to [version]
  static Future updateApp(String version) async {
    if (Platform.isAndroid) {
      await _updateAndroidApp(version);
    } else if (Platform.isMacOS) {
      await _updateMacOsApp(version);
    }
  }

  /// Updates the MacOS app to [version]
  static Future _updateMacOsApp(String version) async {
    SimpleLogger().info("Downloading new version...");
    Int8Buffer fileContent = await _doRequest("/macos/Debug.zip");
    // Int8Buffer fileContent = await _doRequest(
    //     "/macos/$version/noheva_visitor_ui.app/Contents/MacOS/noheva_visitor_ui");
    String? storageDir =
        (await getApplicationDocumentsDirectory()).absolute.path;
    File zipFile = File("$storageDir/Debug.zip");
    SimpleLogger().info("Creating .zip file");
    if (await zipFile.exists()) {
      await zipFile.delete();
    }
    await zipFile.create();
    SimpleLogger().info("Writing content to the .zip file...");
    await zipFile.writeAsBytes(fileContent);
    final inputStream = InputFileStream(zipFile.path);
    final archive = ZipDecoder().decodeBuffer(inputStream);
    extractFileToDisk(zipFile.path, storageDir + "/" + "noheva_visitor_ui.app");
    // for (var file in archive.files) {
    //   String name = "$storageDir/${file.name}";
    //   print("File name: ${file.name}");
    //   print("Is File: ${file.isFile}");
    //   if (file.name.startsWith("__MACOSX")) continue;
    //   if (!file.isFile) {
    //     Directory dir = Directory(name);
    //     if (!(await dir.parent.exists())) {
    //       await dir.parent.create(recursive: true);
    //     }
    //     if (await dir.exists()) {
    //       await dir.delete(recursive: true);
    //     }
    //     await dir.create(recursive: true);
    //     print("Created directory: ${dir.absolute.path}");
    //     await Process.run("chmod", ["777", dir.absolute.path]);
    //   } else {
    //     File newFile = File("$storageDir/${file.name}");
    //     final outputStream = OutputFileStream(name);
    //     file.writeContent(outputStream);
    //     await outputStream.close();
    //     // if (await newFile.exists()) {
    //     //   await newFile.delete();
    //     // }
    //     // await newFile.create();
    //     // await newFile.writeAsBytes(file.content);
    //     print("Created file: ${newFile.absolute.path}");
    //     await Process.run("chmod", ["777", newFile.absolute.path]);
    //   }
    // }
    final res =
        await Process.run("open", ["$storageDir/noheva_visitor_ui.app"]);
    print("Result: ${res.stdout}");
    print("Error: ${res.stderr}");
    // File appFile = File("$storageDir/noheva_visitor_ui.app");

    // SimpleLogger().info("Creating new .app file...");
    // if (await appFile.exists()) {
    //   await appFile.delete();
    // }
    // await appFile.create();

    // SimpleLogger().info("Writing content to the .app file...");
    // await appFile.writeAsBytes(fileContent);
    // Uri appFileUri = Uri(path: appFile.absolute.path, scheme: "file");
    // if (await canLaunchUrl(appFileUri)) {
    //   await launchUrl(appFileUri);
    // }
  }

  /// Updates the Android app to [version]
  static Future _updateAndroidApp(String version) async {
    SimpleLogger().info("Downloading new version...");
    String architecture = configuration.getAndroidArchitecture();
    Int8Buffer fileContent =
        await _doRequest("/android/$version/app-$architecture-release.apk");
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
    print("URI: $uri");
    HttpClient httpClient = HttpClient();
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();

    return await offlineFileController.readResponseToBytes(response);
  }
}
