import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";

import "../model/page.dart";

part "page_dao.g.dart";

/// DAO class for Page entities
@DriftAccessor(tables: [Pages])
class PageDao extends DatabaseAccessor<Database> with _$PageDaoMixin {
  PageDao(Database database) : super(database);

  /// Stores given [page] to database and returns the inserted row
  Future<Page> storePage(PagesCompanion page) async {
    await into(pages).insertOnConflictUpdate(page);
    return (await findPage(page.id.value.toString()))!;
  }

  /// Finds Page by [pageId]
  Future<Page?> findPage(String pageId) async {
    return (select(pages)..where((row) => row.id.equals(pageId)))
        .getSingleOrNull();
  }

  /// Finds Page by [exhibitionId] and [orderNumber]
  Future<Page?> findPageByOrderNumber(
      String exhibitionId, int orderNumber) async {
    return (select(pages)
          ..where((row) => row.exhibitionId.equals(exhibitionId))
          ..where((row) => row.orderNumber.equals(orderNumber)))
        .getSingleOrNull();
  }

  /// Updates given [page] in database and returns the updated row
  Future<Page> updatePage(Page page) async {
    await update(pages).replace(page);

    return (select(pages).getSingleOrNull().then((row) => row!));
  }

  /// Deletes existing Pages from database
  Future<void> deletePages() async {
    await delete(pages).go();
  }

  /// Deletes page by [id]
  Future<void> deletePage(String id) async {
    await (delete(pages)..where((row) => row.id.equals(id))).go();
  }

  /// Lists all Pages by [exhibitionId]
  Future<List<Page>> listPages(String exhibitionId) async {
    return (select(pages)
          ..where((row) => row.exhibitionId.equals(exhibitionId)))
        .get();
  }

  /// Lists all Pages where resource with [data] is used
  Future<List<Page>> listPagesWithResource(String data) async {
    return (select(pages)..where((row) => row.resources.contains(data))).get();
  }
}

final pageDao = PageDao(database);
