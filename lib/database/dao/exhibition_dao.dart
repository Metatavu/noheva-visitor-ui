import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "../model/exhibition.dart";

part "exhibition_dao.g.dart";

/// DAO class for Exhibition entities
@DriftAccessor(tables: [Exhibitions])
class ExhibitionDao extends DatabaseAccessor<Database>
    with _$ExhibitionDaoMixin {
  ExhibitionDao(Database database) : super(database);

  /// Stores given [exhibition] to database and returns the inserted row
  Future<Exhibition> storeExhibition(ExhibitionsCompanion exhibition) async {
    await into(exhibitions).insert(exhibition);

    return (select(exhibitions).getSingleOrNull().then((row) => row!));
  }

  /// Updates given [exhibition] in database and returns the updated row
  // Future<Exhibition> updateExhibition(Exhibition exhibition) async {
  // }

  /// Deletes existing Exhibitions from database
  Future deleteExhibitions() async {
    await delete(exhibitions).go();
  }

  /// TODO: Add docs
  Stream<Exhibition?> watchExhibition() {
    return select(exhibitions).watchSingleOrNull();
  }

  /// TODO: Add docs
  Future<Exhibition?> getExhibition(String exhibitionId) {
    return (select(exhibitions)..where((row) => row.id.equals(exhibitionId)))
        .getSingleOrNull();
  }
}

final exhibitionDao = ExhibitionDao(database);
