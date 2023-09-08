import "package:drift/drift.dart";

/// Exhibition persistence model
@DataClassName("Exhibition")
class Exhibitions extends Table {
  TextColumn get id => text()();
  TextColumn get exhibitionDeviceId => text()();
  TextColumn get exhibitionDeviceGroupId => text()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}
