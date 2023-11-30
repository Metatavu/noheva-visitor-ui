import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:noheva_visitor_ui/database/dao/device_exhibition_detail_dao.dart";
import "package:noheva_visitor_ui/database/dao/key_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
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
  late StreamSubscription _streamSubscription;

  /// Navigates to [PageScreen] with [pageId]
  void _navigateToPageScreen(String pageId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PageScreen(pageId: pageId),
      ),
    );
  }

  /// Handles stream events
  ///
  /// If event is not null, navigates to [PageScreen] with [event] as [pageId]
  void _handleStreamEvent(dynamic event) {
    if (event != null) {
      _navigateToPageScreen(event);
    }
  }

  /// Checks device approval status from local database
  Future _checkDeviceApproval() async {
    final deviceIsApproved = await keyDao.checkIsDeviceApproved();
    if (!deviceIsApproved) {
      Timer.periodic(const Duration(seconds: 5), (timer) async {
        SimpleLogger().info("Checking whether device has been approved...");
        bool isApproved = await keyDao.checkIsDeviceApproved();
        setState(() => _isDeviceApproved = isApproved);
        if (isApproved) {
          SimpleLogger().info("Device is approved, loading device data...");
          await _loadDeviceData();
          timer.cancel();
        }
      });
    } else {
      SimpleLogger().info("Device is approved, loading device data...");
      await _loadDeviceData();
    }
    setState(() => _isDeviceApproved = deviceIsApproved);
  }

  /// Loads device data from API and updates local database
  Future _loadDeviceData() async {
    SimpleLogger().info("Loading device data...");
    final deviceExhibitionDetail =
        await deviceExhitionDetailDao.getDeviceExhibitionDetail();
    if (deviceExhibitionDetail != null && deviceId != null) {
      SimpleLogger().info("Device is attached to an Exhibition!");
      final exhibitionId = deviceExhibitionDetail.exhibitionId;
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

      final firstPage = await pageDao.findPageByOrderNumber(exhibitionId, 0);
      if (firstPage != null) {
        SimpleLogger().info("Navigating to first page...");
        _navigateToPageScreen(firstPage.id);
      } else {
        SimpleLogger().info("No pages found.");
      }
    } else {
      SimpleLogger().info("Device is not attached to an Exhibition!");
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscription = streamController.stream.listen(_handleStreamEvent);
    _checkDeviceApproval();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
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
