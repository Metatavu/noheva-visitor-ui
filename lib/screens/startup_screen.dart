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
      int currentVersionCode = _parseVersion(currentVersion);
      int serverVersionCode = _parseVersion(serverVersion);

      SimpleLogger().info("Server version: $serverVersion");
      if (serverVersionCode > currentVersionCode) {
        SimpleLogger().info("Update available! "
            "Current: $currentVersion ($currentVersionCode), "
            "Server: $serverVersion ($serverVersionCode)");

        setState(() {
          _updateAvailable = true;
          _serverVersion = serverVersion;
        });
      } else {
        SimpleLogger()
            .info("No update available. Navigating to Default Screen. "
                "Current: $currentVersion ($currentVersionCode), "
                "Server: $serverVersion ($serverVersionCode)");
        _navigateForward();
      }
    } else {
      SimpleLogger().warning("Couldn't get server version.");
    }
  }

  int _parseVersion(String version) {
    // Match the version prefix: up to three dot-separated numbers at the beginning
    final match = RegExp(r'^(\d+)\.(\d+)\.(\d+)').firstMatch(version);

    if (match == null) {
      throw FormatException('Invalid version format: $version');
    }

    // Extract and pad each numeric component
    final major = match.group(1)!.padLeft(2, '0');
    final minor = match.group(2)!.padLeft(2, '0');
    final patch = match.group(3)!.padLeft(2, '0');

    final combined = '$major$minor$patch';

    return int.parse(combined);
  }

  /// Navigates to default screen
  void _navigateForward() {
    if (deviceId != null) {
      SimpleLogger().info(
        "Device setup complete, navigating to Default Screen.",
      );
      NavigationUtils.navigateToDefaultScreen(context);
    } else {
      SimpleLogger().info(
        "Device setup not complete, navigating to Setup Screen.",
      );
      NavigationUtils.navigateToDeviceSetupScreen(context);
    }
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
        Timer(const Duration(milliseconds: 3000), _navigateForward);
      }
    } catch (e) {
      SimpleLogger().shout("Couldn't check for updates: $e");
    }
    setState(() => _loading = false);
  }

  /// On click handler for button
  Future<void> _handleUpdate() async {
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
          Column(
            children: [
              Text(AppLocalizations.of(context)!.updateAvailable),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _navigateForward,
                    child: Text(AppLocalizations.of(context)!.skip),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: _handleUpdate,
                    child:
                        Text(AppLocalizations.of(context)!.installUpdateButton),
                  ),
                ],
              ),
            ],
          )
        ] else
          Text(AppLocalizations.of(context)!.startingApplication),
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
