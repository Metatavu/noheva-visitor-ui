import "dart:async";
import "package:defer_pointer/defer_pointer.dart";
import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
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
  late StreamSubscription<String?> _streamSubscription;

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
    _streamSubscription = pageStreamController.stream.listen((event) {
      if (event != null) {
        _loadPage(event);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<NohevaScreen>(
            builder: (context) => const DefaultScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: DeferredPointerHandler(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            child: HtmlWidget(
              _pageHtml ?? "",
              customWidgetBuilder: (element) => HtmlWidgets.buildCustomWidget(
                element,
                _pageResources,
                _eventTriggers,
                _enterTransitions,
                _exitTransitions,
                context,
                {},
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
                    "font-family": "Larken-Medium",
                  };
                }
                if (element.localName == "p") {
                  return {
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
