import "package:flutter/material.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/actions/abstract_page_action_provider.dart";
import "package:noheva_visitor_ui/database/dao/page_dao.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";
import "package:noheva_visitor_ui/screens/page_screen.dart";
import "package:noheva_visitor_ui/utils/navigation_utils.dart";
import "package:simple_logger/simple_logger.dart";

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

        if (sourcePage == null) {
          SimpleLogger().shout(
              "Attempted to navigate from non-existing page ${screen.widget.pageId}!");
          return;
        }

        _navigateToPage(
          screen.context,
          targetPageId,
          targetPage.enterTransitions,
          sourcePage.exitTransitions,
        );
      }
    }
  }

  void _navigateToPage(
    BuildContext context,
    String targetPageId,
    List<ExhibitionPageTransition> enterTransition,
    List<ExhibitionPageTransition> exitTransition,
  ) {
    NavigationUtils.navigateTo(
      PageScreen(pageId: targetPageId),
      context,
      enterTransition: enterTransition.firstOrNull,
      exitTransition: exitTransition.firstOrNull,
    );
  }
}
