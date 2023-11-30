import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_sparkle/flutter_sparkle.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/app_updates/app_updater.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/utils/device_info.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:simple_logger/simple_logger.dart";

/// Startup Screen
class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

/// Software Update Screen State
class _StartupScreenState extends State<StartupScreen> {
  bool _loading = false;
  bool _updateAvailable = false;
  String? _serverVersion;

  /// Checks whether an Android Noheva software update is available
  Future<void> _checkAndroidSoftwareUpdate() async {
    SimpleLogger().info("Checking for Android software update...");
    String currentVersion = await Updater.getCurrentVersion();
    String? serverVersion = await Updater.getServerVersion();
    if (serverVersion != null) {
      SimpleLogger().info("Server version: $serverVersion");
      if (currentVersion != serverVersion) {
        SimpleLogger().info("Update available!");
        setState(() {
          _updateAvailable = true;
          _serverVersion = serverVersion;
        });
      } else {
        SimpleLogger().info(
          "No update available. Navigating to Default Screen.",
        );
        _navigateToDefaultScreen();
      }
    } else {
      SimpleLogger().warning("Couldn't get server version.");
    }
  }

  /// Navigates to default screen
  void _navigateToDefaultScreen() {
    NavigationUtils.navigateToDefaultScreen(context);
  }

  /// Checks for updates on startup
  void _checkSoftwareUpdate() {
    setState(() => _loading = true);
    try {
      var nohevaDeviceType = DeviceInfo.getNohevaDeviceType();
      if (nohevaDeviceType == DeviceType.NOHEVA_ANDROID) {
        _checkAndroidSoftwareUpdate();
      }
      if (nohevaDeviceType == DeviceType.NOHEVA_MACOS) {
        FlutterSparkle.checkMacUpdate(
          "${configuration.getAppUpdatesBaseUrl()}/macos/appcast.xml",
        );
        SimpleLogger().info("Initialized Sparkle updater.");
        // Navigating immediately seems to freeze the whole app.
        Timer(const Duration(milliseconds: 3000), _navigateToDefaultScreen);
      }
    } catch (e) {
      SimpleLogger().shout("Couldn't check for updates: $e");
    }
    setState(() => _loading = false);
  }

  /// On click handler for button
  Future _handleUpdate() async {
    if (_serverVersion == null) return;
    setState(() => _loading = true);
    try {
      await Updater.updateApp(_serverVersion!);
    } catch (e) {
      SimpleLogger().shout("Couldn't update app: $e");
    }
    setState(() => _loading = false);
  }

  /// Renders UI for either updating software or starting the application
  Widget _renderUI() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_updateAvailable) ...[
          ElevatedButton(
            onPressed: _navigateToDefaultScreen,
            child: Text(AppLocalizations.of(context)!.skip),
          ),
          const SizedBox(width: 50),
          ElevatedButton(
            onPressed: _handleUpdate,
            child: Text(AppLocalizations.of(context)!.installUpdateButton),
          ),
        ] else
          Text(AppLocalizations.of(context)!.startingApplication)
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _checkSoftwareUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _loading
              ? [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.loading,
                    style: const TextStyle(fontSize: 20),
                  ),
                ]
              : [_renderUI()],
        ),
      ),
    );
  }
}
