import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/main.dart";
import "package:noheva_visitor_ui/screens/default_screen.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:simple_logger/simple_logger.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart" as pc;

/// Page Screen
///
/// Displays Page [pageId] content
class PageScreen extends StatefulWidget {
  final String pageId;

  const PageScreen({Key? key, required this.pageId}) : super(key: key);

  @override
  State<PageScreen> createState() => _PageScreenState();
}

/// Exhibition screen state
class _PageScreenState extends State<PageScreen> {
  String? _pageHtml;
  final List<ExhibitionPageResource> _pageResources = [];
  final List<ExhibitionPageEventTrigger> _eventTriggers = [];

  /// Loads page and its content by [pageId]
  Future _loadPage(String pageId) async {
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

    setState(() {
      _pageHtml = pc.PageController.substitutePageResources(
        layout.data,
        page.resources,
      );
      _pageResources.addAll(page.resources);
      _eventTriggers.addAll(page.eventTriggers);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPage(widget.pageId);
    streamController.stream.listen((event) {
      if (event != null) {
        _loadPage(event);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DefaultScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: HtmlWidget(
            _pageHtml ?? "",
            customWidgetBuilder: (element) => HtmlWidgets.buildCustomWidget(
              element,
              _pageResources,
              _eventTriggers,
              context,
            ),
          ),
        ),
      ),
    );
  }
}
