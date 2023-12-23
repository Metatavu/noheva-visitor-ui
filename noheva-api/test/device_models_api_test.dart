import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for DeviceModelsApi
void main() {
  final instance = NohevaApi().getDeviceModelsApi();

  group(DeviceModelsApi, () {
    // Create a device model
    //
    // Creates new exhibition device model
    //
    //Future<DeviceModel> createDeviceModel(DeviceModel deviceModel) async
    test('test createDeviceModel', () async {
      // TODO
    });

    // Deletes device model.
    //
    // Delets exhibition device model.
    //
    //Future deleteDeviceModel(String deviceModelId) async
    test('test deleteDeviceModel', () async {
      // TODO
    });

    // Find a device model
    //
    // Finds a device model by id
    //
    //Future<DeviceModel> findDeviceModel(String deviceModelId) async
    test('test findDeviceModel', () async {
      // TODO
    });

    // List device models
    //
    // List exhibition device models
    //
    //Future<BuiltList<DeviceModel>> listDeviceModels() async
    test('test listDeviceModels', () async {
      // TODO
    });

    // Updates device model.
    //
    // Updates device model.
    //
    //Future<DeviceModel> updateDeviceModel(String deviceModelId, DeviceModel deviceModel) async
    test('test updateDeviceModel', () async {
      // TODO
    });

  });
}
