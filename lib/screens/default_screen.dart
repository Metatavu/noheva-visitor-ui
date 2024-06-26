import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/database/dao/device_exhibition_detail_dao.dart";
import "package:noheva_visitor_ui/database/dao/key_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/device_settings.dart";
import "package:noheva_visitor_ui/utils/layout_controller.dart";
import "package:simple_logger/simple_logger.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart" as pc;

/// Default Screen
class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

/// Default Screen State
class _DefaultScreenState extends State<DefaultScreen> {
  bool _isDeviceApproved = false;
  late StreamSubscription<LoadExhibitionPageByIdEvent>
      _loadExhibitionPageByIdEventSubscription;
  Timer? _deviceApprovalTimer;

  /// Navigates to [PageScreen] with [pageId]
  void _navigateToPageScreen(String pageId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<PageScreen>(
        builder: (context) => PageScreen(pageId: pageId),
      ),
    );
  }

  /// Handles stream events
  ///
  /// If event is not null, navigates to [PageScreen] with [event] as [pageId]
  void _handleStreamEvent(LoadExhibitionPageByIdEvent event) {
    final eventPageId = event.pageId;
    if (eventPageId != null) {
      _navigateToPageScreen(eventPageId);
    }
  }

  /// Checks device approval status from local database
  Future<void> _checkDeviceApproval() async {
    final deviceIsApproved = await keyDao.checkIsDeviceApproved();
    if (!deviceIsApproved) {
      _deviceApprovalTimer = Timer.periodic(
        const Duration(seconds: 5),
        (timer) async {
          SimpleLogger().info("Checking whether device has been approved...");
          bool isApproved = await keyDao.checkIsDeviceApproved();
          setState(() => _isDeviceApproved = isApproved);
          if (isApproved) {
            SimpleLogger().info("Device is approved, loading device data...");
            await _loadExhibition();
            timer.cancel();
          }
        },
      );
    } else {
      SimpleLogger().info("Device is approved, loading device data...");
      await _loadExhibition();
    }
    if (mounted) {
      setState(() => _isDeviceApproved = deviceIsApproved);
    }
  }

  /// Loads device data from API and updates local database if needed
  Future<void> _loadDeviceData(String exhibitionId) async {
    try {
      SimpleLogger().info("Loading device data from API...");
      final deviceDataApi = await apiFactory.getDeviceDataApi();
      SimpleLogger().info("Loading layouts...");
      await LayoutController.loadLayouts(deviceId!);
      SimpleLogger().info("Loading pages...");
      final pages = (await deviceDataApi.listDeviceDataPages(
        deviceId: deviceId!,
      ))
          .data!
          .toList();
      await pc.PageController.comparePages(exhibitionId, pages);
    } catch (exception) {
      SimpleLogger().shout("Error loading device data from API: $exception");
    }
  }

  /// Loads exhibition data and displays the first page
  Future<void> _loadExhibition() async {
    try {
      SimpleLogger().info("Loading exhibition...");
      final deviceExhibitionDetail =
          await deviceExhitionDetailDao.getDeviceExhibitionDetail();
      if (deviceExhibitionDetail != null && deviceId != null) {
        SimpleLogger().info("Device is attached to an Exhibition!");
        final exhibitionId = deviceExhibitionDetail.exhibitionId;
        await _loadDeviceData(exhibitionId);
        final firstPage = await pageDao.findPageByOrderNumber(exhibitionId, 0);
        if (firstPage != null) {
          SimpleLogger().info("Navigating to first page...");
          _navigateToPageScreen(firstPage.id);
        } else {
          SimpleLogger().info("First page not found.");
        }
      } else {
        SimpleLogger().info("Device is not attached to an Exhibition!");
      }
    } catch (exception) {
      SimpleLogger().shout("Error loading exhibition: $exception");
    }
  }

  @override
  void initState() {
    DeviceSettings.applyDeviceSettings();
    super.initState();
    _loadExhibitionPageByIdEventSubscription =
        eventBus.on<LoadExhibitionPageByIdEvent>().listen(_handleStreamEvent);
    _checkDeviceApproval();
  }

  @override
  void dispose() {
    _loadExhibitionPageByIdEventSubscription.cancel();
    _deviceApprovalTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isDeviceApproved
                ? AppLocalizations.of(context)!.deviceIsApproved
                : AppLocalizations.of(context)!.deviceNotYetApproved),
          ],
        ),
      ),
    );
  }
}
