import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/dao/exhibition_dao.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";
import "package:simple_logger/simple_logger.dart";

/// Exhibition Screen
///
/// Displays Exhibition [exhibitionId] content
class ExhibitionScreen extends StatefulWidget {
  final String exhibitionId;

  const ExhibitionScreen({Key? key, required this.exhibitionId})
      : super(key: key);

  @override
  State<ExhibitionScreen> createState() => _ExhibitionScreenState();
}

/// Exhibition screen state
class _ExhibitionScreenState extends State<ExhibitionScreen> {
  String? _pageHtml;
  final List<ExhibitionPageResource> _pageResources = [];
  final List<ExhibitionPageEventTrigger> _eventTriggers = [];

  /// TODO: Add docs
  Future _loadExhibition(String exhibitionId) async {
    SimpleLogger().info("Loading exhibition $exhibitionId...");
    final exhibition = await exhibitionDao.getExhibition(exhibitionId);
    SimpleLogger().info("Successfully loaded exhibition!");
    SimpleLogger().info("Loading exhibition pages...");
    final pages = await pageDao.listPages(exhibitionId);
    SimpleLogger().info("Successfully loaded ${pages.length} pages!");
    SimpleLogger().info("Loading page layouts...");
    final layouts = [];
    for (var page in pages) {
      layouts.add(await layoutDao.findLayout(page.layoutId));
    }
    SimpleLogger().info("Successfully loaded ${layouts.length} layouts!");

    setState(() {
      _pageHtml = layouts[0]?.data ?? "";
      _pageResources.addAll(pages[0].resources);
      _eventTriggers.addAll(pages[0].eventTriggers);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadExhibition(widget.exhibitionId);
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
            ),
          ),
        ),
      ),
    );
  }
}
