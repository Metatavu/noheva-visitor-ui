import "dart:async";
import "package:defer_pointer/defer_pointer.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/event_bus/event_bus.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";
import "package:noheva_visitor_ui/utils/custom_widget_factory.dart";
import "package:simple_logger/simple_logger.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart" as pc;

/// Page Screen
///
/// Displays Page [pageId] content
class PageScreen extends NohevaScreen {
  final String pageId;

  const PageScreen({Key? key, required this.pageId}) : super(key: key);

  @override
  State<PageScreen> createState() => PageScreenState();
}

/// Exhibition screen state
class PageScreenState extends NohevaScreenState<PageScreen> {
  String? _pageHtml;
  final List<ExhibitionPageResource> _pageResources = [];
  final List<ExhibitionPageEventTrigger> _eventTriggers = [];
  final List<ExhibitionPageTransition> _enterTransitions = [];
  final List<ExhibitionPageTransition> _exitTransitions = [];
  late StreamSubscription<LoadExhibitionPageByIdEvent>
      _loadExhibitionPageByIdEventSubscription;
  late StreamSubscription<RequestAchiveExhibitionPageIdEvent>
      _activeExhibitionPageIdEventStreamSubscription;

  /// Loads page and its content by [pageId]
  Future<void> _loadPage(String pageId) async {
    SimpleLogger().info("Loading page $pageId ...");
    final page = await pageDao.findPage(pageId);
    if (page == null) {
      throw Exception("Page $pageId not found!");
    }
    SimpleLogger().info("Loading layout ${page.layoutId}...");
    final layout = await layoutDao.findLayout(page.layoutId);
    if (layout == null) {
      throw Exception("Layout ${page.layoutId} not found!");
    }

    applyPageEventTriggers(page.eventTriggers);

    setState(() {
      _pageHtml = pc.PageController.substitutePageResources(
        layout.data,
        page.resources,
      );
      _pageResources.addAll(page.resources);
      _eventTriggers.addAll(page.eventTriggers);
      _enterTransitions.addAll(page.enterTransitions);
      _exitTransitions.addAll(page.exitTransitions);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPage(widget.pageId);
    _loadExhibitionPageByIdEventSubscription =
        eventBus.on<LoadExhibitionPageByIdEvent>().listen((event) {
      final eventPageId = event.pageId;
      if (eventPageId != null) {
        _loadPage(eventPageId);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<NohevaScreen>(
            builder: (context) => const DefaultScreen(),
          ),
        );
      }
    });
    _activeExhibitionPageIdEventStreamSubscription =
        eventBus.on<RequestAchiveExhibitionPageIdEvent>().listen(
              (_) => eventBus.fire(
                ActiveExhibitionPageIdEvent(widget.pageId),
              ),
            );
  }

  @override
  void dispose() {
    _loadExhibitionPageByIdEventSubscription.cancel();
    _activeExhibitionPageIdEventStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    SimpleLogger().info(
        "Building PageScreen with size (width: $screenWidth, height: $screenHeight)...");

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xff000000),
        body: DeferredPointerHandler(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: HtmlWidget(
              _pageHtml ?? "",
              factoryBuilder: () => CustomWidgetFactory(
                context: context,
                resources: _pageResources,
                eventTriggers: _eventTriggers,
                enterTransitions: _enterTransitions,
                exitTransitions: _exitTransitions,
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
      ),
    );
  }
}
