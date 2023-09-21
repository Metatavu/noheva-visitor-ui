import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";
import '../model/device_exhibition_mapping.dart';

part "device_exhibition_mapping_dao.g.dart";

/// DAO class for Exhibition entities
@DriftAccessor(tables: [DeviceExhibitionMappings])
class DeviceExhibitionMappingDao extends DatabaseAccessor<Database>
    with _$DeviceExhibitionMappingDaoMixin {
  DeviceExhibitionMappingDao(Database database) : super(database);

  /// Stores given [exhibition] to database and returns the inserted row
  Future<DeviceExhibitionMapping> storeExhibition(
      DeviceExhibitionMappingsCompanion exhibition) async {
    await into(deviceExhibitionMappings).insertOnConflictUpdate(exhibition);

    return (await findExhibition(exhibition.exhibitionId.value))!;
  }

  /// Deletes existing Exhibitions from database
  Future<int> deleteExhibitions() async {
    return await delete(deviceExhibitionMappings).go();
  }

  /// TODO: Add docs
  Future<DeviceExhibitionMapping?> findExhibition(String exhibitionId) {
    return (select(deviceExhibitionMappings)
          ..where((row) => row.exhibitionId.equals(exhibitionId)))
        .getSingleOrNull();
  }

  /// TODO: Add docs
  Future<DeviceExhibitionMapping?> getExhibition() {
    return (select(deviceExhibitionMappings)..limit(1)).getSingleOrNull();
  }
}

final exhibitionDao = DeviceExhibitionMappingDao(database);
