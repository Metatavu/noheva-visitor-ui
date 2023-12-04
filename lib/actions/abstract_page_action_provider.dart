import "package:collection/collection.dart";
import "package:flutter/foundation.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/screens/noheva_screen.dart";

/// Abstract Page Action Provider
abstract class AbstractPageActionProvider {
  final List<ExhibitionPageEventProperty> properties;
  abstract ExhibitionPageEventActionType actionType;

  /// Constructs a new [AbstractPageActionProvider] with given [properties]
  AbstractPageActionProvider({required this.properties});

  void performAction(NohevaScreenState screen);

  /// Gets property id by [name]
  @protected
  String? getPropertyId(String name) {
    return getPropertyValue(name);
  }

  /// Gets property value by [name]
  @protected
  String? getPropertyValue(String name) {
    return _getProperty(name)?.value;
  }

  /// Gets property by [name]
  ExhibitionPageEventProperty? _getProperty(String name) {
    return properties.firstWhereOrNull((element) => element.name == name);
  }
}
