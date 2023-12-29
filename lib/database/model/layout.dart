import "package:drift/drift.dart";

/// Layout persistence model
@DataClassName("Layout")
class Layouts extends Table {
  TextColumn get id => text()();
  IntColumn get screenOrientation => integer()();
  TextColumn get data => text()();
  DateTimeColumn get modifiedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
