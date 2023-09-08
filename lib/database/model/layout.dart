import "package:drift/drift.dart";

/// Layout persistence model
@DataClassName("Layout")
class Layouts extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get orientation => integer()();
  TextColumn get data => text()();
  DateTimeColumn get modifiedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
