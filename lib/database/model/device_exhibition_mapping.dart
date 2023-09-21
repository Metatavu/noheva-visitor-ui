import "package:drift/drift.dart";

/// Device Exhibition Mapping persistence model
@DataClassName("DeviceExhibitionMapping")
class DeviceExhibitionMappings extends Table {
  TextColumn get exhibitionId => text()();
  TextColumn get exhibitionDeviceId => text()();
  TextColumn get exhibitionDeviceGroupId => text()();

  @override
  Set<Column> get primaryKey => {exhibitionId};
}
