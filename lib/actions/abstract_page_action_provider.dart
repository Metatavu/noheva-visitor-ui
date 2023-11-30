import "package:collection/collection.dart";
import "package:flutter/foundation.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";

abstract class AbstractPageActionProvider {
  final List<ExhibitionPageEventProperty> properties;
  abstract ExhibitionPageEventActionType actionType;

  AbstractPageActionProvider({required this.properties});

  void performAction(NohevaScreenState screen);

  @protected
  String? getPropertyId(String name) {
    return getPropertyValue(name);
  }

  @protected
  String? getPropertyValue(String name) {
    return _getProperty(name)?.value;
  }

  ExhibitionPageEventProperty? _getProperty(String name) {
    return properties.firstWhereOrNull((element) => element.name == name);
  }
}
