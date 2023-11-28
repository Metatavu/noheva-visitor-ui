import "package:drift/drift.dart";

/// Device Exhibition Details persistence model
@DataClassName("DeviceExhibitionDetail")
class DeviceExhibitionDetails extends Table {
  TextColumn get exhibitionId => text()();
  TextColumn get exhibitionDeviceId => text()();
  TextColumn get exhibitionDeviceGroupId => text()();

  @override
  Set<Column> get primaryKey => {exhibitionId};
}
