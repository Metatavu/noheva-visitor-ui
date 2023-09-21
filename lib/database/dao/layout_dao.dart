import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "../model/layout.dart";

part "layout_dao.g.dart";

/// DAO class for Layout entities
@DriftAccessor(tables: [Layouts])
class LayoutDao extends DatabaseAccessor<Database> with _$LayoutDaoMixin {
  LayoutDao(Database database) : super(database);

  /// Stores given [layout] to database and returns the inserted row
  Future<Layout> storeLayout(LayoutsCompanion layout) async {
    await into(layouts).insertOnConflictUpdate(layout);

    return (await findLayout(layout.id.value.toString()))!;
  }

  /// Updates given [layout] in database and returns the updated row
  Future<Layout> updateLayout(Layout layout) async {
    await update(layouts).replace(layout);

    return (select(layouts).getSingleOrNull().then((row) => row!));
  }

  /// Deletes existing Layouts from database
  Future deleteLayouts() async {
    await delete(layouts).go();
  }

  /// Finds Layout by [layoutId]
  Future<Layout?> findLayout(String layoutId) async {
    return (select(layouts)..where((row) => row.id.equals(layoutId)))
        .getSingleOrNull();
  }

  /// Lists all Layouts
  Future<List<Layout>> listLayouts() async {
    return select(layouts).get();
  }
}

final layoutDao = LayoutDao(database);
