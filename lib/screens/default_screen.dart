import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_visitor_ui/database/dao/device_exhibition_detail_dao.dart";
import "package:noheva_visitor_ui/database/dao/key_dao.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/custom_widget_factory.dart";
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
  void _navigateToPageScreen(String pageId) async {
    final page = await pageDao.findPage(pageId);
    if (page == null) {
      SimpleLogger().shout("Page $pageId not found!");
      return;
    }
    final layout = await layoutDao.findLayout(page.layoutId);
    if (layout == null) {
      SimpleLogger().shout("Layout ${page.layoutId} not found!");
      return;
    }
    final pageHtml =
        pc.PageController.substitutePageResources(layout.data, page.resources);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<PageScreen>(
        builder: (context) => PageScreen(
          pageId: pageId,
          pageWidget: HtmlWidget(
            pageHtml,
            factoryBuilder: () => CustomWidgetFactory(
              pageId: pageId,
              context: context,
              resources: page.resources,
              eventTriggers: page.eventTriggers,
              enterTransitions: page.enterTransitions,
              exitTransitions: page.exitTransitions,
            ),
            customStylesBuilder: (element) {
              if (element.localName == "div") {
                return {
                  "padding": "0px",
                };
              }
              if (["h1", "h2", "h3", "h4", "h5", "h6"]
                  .contains(element.localName)) {
                return {
                  "margin": "0px",
                  "font-family": "Larken-Medium",
                };
              }
              if (element.localName == "p") {
                return {
                  "margin": "0px",
                  "font-family": "Source-Sans-Pro-Regular",
                };
              }

              return null;
            },
          ),
        ),
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
            await _loadDeviceData();
            timer.cancel();
          }
        },
      );
    } else {
      SimpleLogger().info("Device is approved, loading device data...");
      await _loadDeviceData();
    }
    if (mounted) {
      setState(() => _isDeviceApproved = deviceIsApproved);
    }
  }

  /// Loads device data from API and updates local database
  Future<void> _loadDeviceData() async {
    try {
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
    } catch (exception) {
      SimpleLogger().shout("Error loading device data: $exception");
    }
  }

  @override
  void initState() {
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
