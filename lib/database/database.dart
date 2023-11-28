import "dart:io";
import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:noheva_visitor_ui/database/model/device_exhibition_detail.dart";
import "package:noheva_visitor_ui/database/model/key.dart";
import "package:noheva_visitor_ui/database/model/layout.dart";
import "package:noheva_visitor_ui/database/model/page.dart";
import "package:path_provider/path_provider.dart";
import "package:path/path.dart" as p;
import "package:noheva_api/noheva_api.dart";
import "package:noheva_visitor_ui/database/converters/list_converter.dart";

part "database.g.dart";

/// Database class
///
/// Opens an in-file database, creating it if it doesn't exist.
/// Add new migrations to [migration.onUpgrade] and bump the [schemaVersion].
@DriftDatabase(
  tables: [
    Keys,
    DeviceExhibitionDetails,
    Layouts,
    Pages,
  ],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (Migrator migrator) async {
      await migrator.createAll();
    }, beforeOpen: (OpeningDetails details) async {
      // According to documentation, SQLite3 foreign keys need to be explicitly enabled
      // https://drift.simonbinder.eu/docs/getting-started/advanced_dart_tables/#references
      await customStatement("PRAGMA foreign_keys = ON");
    }, onUpgrade: (Migrator migrator, int from, int to) async {
      for (int target = from + 1; target <= to; target++) {
        switch (target) {
          case 1:
            return await migrator.create(keys);
          case 2:
            {
              await migrator.create(deviceExhibitionDetails);
              await migrator.create(layouts);
              await migrator.create(pages);
              break;
            }
        }
      }
    });
  }
}

/// Opens connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));

    return NativeDatabase(file);
  });
}

final database = Database();
