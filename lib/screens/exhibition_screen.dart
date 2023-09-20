import "package:flutter/material.dart";
import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_visitor_ui/utils/html_widgets.dart";

/// Exhibition Screen
///
/// Displays Exhibition content
class ExhibitionScreen extends StatefulWidget {
  const ExhibitionScreen({Key? key}) : super(key: key);

  @override
  State<ExhibitionScreen> createState() => _ExhibitionScreenState();
}

/// Exhibition screen state
class _ExhibitionScreenState extends State<ExhibitionScreen> {
  late String _pageHtml;

  @override
  void initState() {
    super.initState();
    setState(() => _pageHtml = "");
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
            _pageHtml,
            customWidgetBuilder: (element) => HtmlWidgets.buildCustomWidget(
              element,
              List.empty(),
              List.empty(),
            ),
          ),
        ),
      ),
    );
  }
}
