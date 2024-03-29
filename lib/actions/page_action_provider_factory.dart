import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/actions/abstract_page_action_provider.dart";
import "package:noheva_visitor_ui/actions/navigate_page_action_provider.dart";
import "package:simple_logger/simple_logger.dart";

/// Page Action Provider factory
class PageActionProviderFactory {
  /// Builds a new [AbstractPageActionProvider] based on [actionType] and [properties]
  static AbstractPageActionProvider? buildProvider(
    ExhibitionPageEventActionType actionType,
    List<ExhibitionPageEventProperty> properties,
  ) {
    switch (actionType) {
      case ExhibitionPageEventActionType.navigate:
        return NavigatePageActionProvider(properties: properties);
      default:
        {
          SimpleLogger()
              .warning("Unknown ExhibitionPageActionType: $actionType");
          return null;
        }
    }
  }
}
