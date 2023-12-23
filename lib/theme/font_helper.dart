import "dart:io";
import "package:flutter/services.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/theme/font.dart";
import "package:noheva_visitor_ui/utils/offline_file_controller.dart";
import "package:path_provider/path_provider.dart";
import "package:path/path.dart" as p;
import "package:simple_logger/simple_logger.dart";
import "package:typed_data/typed_data.dart";

/// Font Helper
///
/// Loads required fonts from file system or downloads them
class FontHelper {
  static final HttpClient _httpClient = HttpClient();
  static final List<Font> _fonts = [
    const Font(
      name: "Source-Sans-Pro-Bold",
      fileName: "SourceSansPro-Bold.ttf",
    ),
    const Font(
      name: "Source-Sans-Pro-BoldItalic",
      fileName: "SourceSansPro-BoldItalic.ttf",
    ),
    const Font(
      name: "Source-Sans-Pro-Italic",
      fileName: "SourceSansPro-Italic.ttf",
    ),
    const Font(
      name: "Source-Sans-Pro-Regular",
      fileName: "SourceSansPro-Regular.ttf",
    ),
    const Font(
      name: "Source-Sans-Pro-SemiBold",
      fileName: "SourceSansPro-SemiBold.ttf",
    ),
    const Font(
      name: "Source-Sans-Pro-SemiBoldItalic",
      fileName: "SourceSansPro-SemiBoldItalic.ttf",
    ),
    const Font(
      name: "Larken-Medium",
      fileName: "Larken-Medium.ttf",
    ),
  ];

  /// Loads offlined fonts into Flutter Engine
  static Future<void> loadOfflinedFonts() async {
    SimpleLogger().info("Loading offlined fonts...");
    for (var font in _fonts) {
      FontLoader fontLoader = FontLoader(font.name);
      fontLoader.addFont(_getOfflinedFont(font.fileName));
      await fontLoader.load();
      SimpleLogger().info("Font ${font.name} loaded!");
    }
    SimpleLogger().info("All fonts loaded!");
  }

  /// Returns offlined font
  ///
  /// If font is already downloaded, returns that. Otherwise downloads it and stores on disk.
  static Future<ByteData> _getOfflinedFont(String font) async {
    SimpleLogger().info("Offlining font $font...");
    String fontsDirectoryPath = await _getFontsDirectoryPath();
    File offlinedFont = File("$fontsDirectoryPath/$font");
    if (await offlinedFont.exists()) {
      SimpleLogger().info("Using already offlined font!");

      return await offlinedFont.readAsBytes().then(
            (bytes) => ByteData.view(
              Uint8List.fromList(bytes).buffer,
            ),
          );
    }
    SimpleLogger().info("Didn't find offlined font, downloading...");
    Uri uri = Uri.parse("${configuration.getCdnBaseUrl()}/fonts/$font");
    HttpClientResponse response = await _httpClient.getUrl(uri).then(
          (request) => request.close(),
        );
    Int8Buffer byteBuffer =
        await offlineFileController.readResponseToBytes(response);

    await offlinedFont.writeAsBytes(byteBuffer);

    return ByteData.view(byteBuffer.buffer);
  }

  /// Returns fonts directory path
  static Future<String> _getFontsDirectoryPath() async {
    Directory fontsDirectory = Directory(
      p.join((await getApplicationSupportDirectory()).path, "fonts"),
    );
    if (!await fontsDirectory.exists()) {
      await fontsDirectory.create();
    }

    return fontsDirectory.path;
  }
}
