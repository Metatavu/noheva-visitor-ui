import "package:drift/drift.dart";
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/converters/list_converter.dart";
import 'package:noheva_visitor_ui/database/model/device_exhibition_mapping.dart';
import "package:noheva_visitor_ui/database/model/layout.dart";

/// Page persistence model
@DataClassName("Page")
class Pages extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get language => text()();
  TextColumn get activeConditionUserVariable => text().nullable()();
  TextColumn get activeConditionEquals => text().nullable()();
  IntColumn get orderNumber => integer()();
  TextColumn get layoutId => text().references(Layouts, #id)();
  TextColumn get exhibitionId =>
      text().references(DeviceExhibitionMappings, #exhibitionId)();
  TextColumn get resources => text().map(
        const ListConverter<ExhibitionPageResource>(),
      )();
  TextColumn get eventTriggers => text().map(
        const ListConverter<ExhibitionPageEventTrigger>(),
      )();
  TextColumn get enterTransitions => text().map(
        const ListConverter<ExhibitionPageTransition>(),
      )();
  TextColumn get exitTransitions => text().map(
        const ListConverter<ExhibitionPageTransition>(),
      )();
  DateTimeColumn get modifiedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
