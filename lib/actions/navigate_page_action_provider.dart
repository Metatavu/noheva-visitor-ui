import "package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/actions/abstract_page_action_provider.dart";
import "package:noheva_visitor_ui/database/dao/layout_dao.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/custom_widget_factory.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:noheva_visitor_ui/utils/page_controller.dart";
import "package:simple_logger/simple_logger.dart";

/// Page Action Provider for navigate events
///
/// Action navigates user to another page
class NavigatePageActionProvider extends AbstractPageActionProvider {
  @override
  ExhibitionPageEventActionType actionType =
      ExhibitionPageEventActionType.navigate;

  NavigatePageActionProvider(
      {required List<ExhibitionPageEventProperty> properties})
      : super(properties: properties);

  @override
  void performAction(NohevaScreenState screen) async {
    if (screen is PageScreenState) {
      final targetPageId = getPropertyId("pageId");
      if (targetPageId != null) {
        var sourcePage = await pageDao.findPage(screen.widget.pageId);
        var targetPage = await pageDao.findPage(targetPageId);

        if (targetPage == null) {
          SimpleLogger().shout(
              "Attempted to navigate to non-existing page $targetPageId!");
          return;
        }
        final layout = await layoutDao.findLayout(targetPage.layoutId);
        if (layout == null) {
          SimpleLogger().shout(
              "Attempted to navigate to page with non-existing layout ${targetPage.layoutId}!");
          return;
        }

        if (sourcePage == null) {
          SimpleLogger().shout(
              "Attempted to navigate from non-existing page ${screen.widget.pageId}!");
          return;
        }
        final pageHtml = PageController.substitutePageResources(
            layout.data, targetPage.resources);
        NavigationUtils.navigateTo(
          PageScreen(
            pageId: targetPageId,
            pageWidget: HtmlWidget(
              pageHtml,
              factoryBuilder: () => CustomWidgetFactory(
                pageId: targetPageId,
                context: screen.context,
                resources: targetPage.resources,
                eventTriggers: targetPage.eventTriggers,
                enterTransitions: targetPage.enterTransitions,
                exitTransitions: targetPage.exitTransitions,
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
          screen.context,
          enterTransition: targetPage.enterTransitions.firstOrNull,
          exitTransition: sourcePage.exitTransitions.firstOrNull,
        );
      }
    }
  }
}
