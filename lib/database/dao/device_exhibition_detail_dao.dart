import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "../model/device_exhibition_detail.dart";

part "device_exhibition_detail_dao.g.dart";

/// DAO class for Device Exhibition Details entities
@DriftAccessor(tables: [DeviceExhibitionDetails])
class DeviceExhibitionDetailDao extends DatabaseAccessor<Database>
    with _$DeviceExhibitionDetailDaoMixin {
  DeviceExhibitionDetailDao(Database database) : super(database);

  /// Stores given [deviceExhibitionDetail] to database and returns the inserted row
  Future<DeviceExhibitionDetail> storeDeviceExhibitionDetail(
      DeviceExhibitionDetailsCompanion deviceExhibitionDetail) async {
    await into(deviceExhibitionDetails)
        .insertOnConflictUpdate(deviceExhibitionDetail);

    return (await findDeviceExhibitionDetail(
        deviceExhibitionDetail.exhibitionId.value))!;
  }

  /// Deletes existing [DeviceExhibitionDetail]s from database
  Future<int> deleteDeviceExhibitionDetails() async {
    return await delete(deviceExhibitionDetails).go();
  }

  /// Finds [DeviceExhibitionDetail] with given [exhibitionId]
  Future<DeviceExhibitionDetail?> findDeviceExhibitionDetail(
      String exhibitionId) {
    return (select(deviceExhibitionDetails)
          ..where((row) => row.exhibitionId.equals(exhibitionId)))
        .getSingleOrNull();
  }

  /// Gets [DeviceExhibitionDetail] from database
  Future<DeviceExhibitionDetail?> getDeviceExhibitionDetail() {
    return (select(deviceExhibitionDetails)..limit(1)).getSingleOrNull();
  }
}

final deviceExhitionDetailDao = DeviceExhibitionDetailDao(database);
