import "package:drift/drift.dart";
import "package:noheva_visitor_ui/database/database.dart";
import "../model/key.dart";

part "key_dao.g.dart";

/// DAO class for Key entities
@DriftAccessor(tables: [Keys])
class KeyDao extends DatabaseAccessor<Database> with _$KeyDaoMixin {
  KeyDao(Database database) : super(database);

  /// Checks if this device is approved e.g. it has received a key from the API.
  Future<bool> checkIsDeviceApproved() async {
    return (select(keys).getSingleOrNull())
        .then((value) => value != null && value.key != null);
  }

  /// Stores given [deviceId] to database
  Future<int> storeDeviceId(String deviceId) async {
    return await into(keys).insert(KeysCompanion.insert(deviceId: deviceId));
  }

  /// Stores given [deviceKey] to database
  Future<int> storeDeviceKey(String deviceKey) async {
    int rowId = (await select(keys).getSingle()).id;

    return (update(keys)..where((row) => row.id.equals(rowId)))
        .write(KeysCompanion(key: Value(deviceKey)));
  }

  /// Returns this devices id
  Future<String?> getDeviceId() async {
    return (select(keys).getSingleOrNull().then((value) => value?.deviceId));
  }

  /// Returns this devices key
  Future<String?> getDeviceKey() async {
    return (select(keys).getSingleOrNull().then((value) => value?.key));
  }
}

final keyDao = KeyDao(database);
