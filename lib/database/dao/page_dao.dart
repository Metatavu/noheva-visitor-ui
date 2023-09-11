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
    await into(pages).insert(page);

    return (select(pages).getSingleOrNull().then((row) => row!));
  }

  /// Updates given [page] in database and returns the updated row
  Future<Page> updatePage(Page page) async {
    await update(pages).replace(page);

    return (select(pages).getSingleOrNull().then((row) => row!));
  }

  /// Deletes existing Pages from database
  Future deletePages() async {
    await delete(pages).go();
  }

  /// Lists all Pages by [exhibitionId]
  Future<List<Page>> listPages(String exhibitionId) async {
    return (select(pages)
          ..where((row) => row.exhibitionId.equals(exhibitionId)))
        .get();
  }
}

final pageDao = PageDao(database);
