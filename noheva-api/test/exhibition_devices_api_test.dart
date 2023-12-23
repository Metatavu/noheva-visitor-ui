import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionDevicesApi
void main() {
  final instance = NohevaApi().getExhibitionDevicesApi();

  group(ExhibitionDevicesApi, () {
    // Create a device
    //
    // Creates new exhibition device
    //
    //Future<ExhibitionDevice> createExhibitionDevice(String exhibitionId, ExhibitionDevice exhibitionDevice) async
    test('test createExhibitionDevice', () async {
      // TODO
    });

    // Deletes device.
    //
    // Delets exhibition device.
    //
    //Future deleteExhibitionDevice(String exhibitionId, String deviceId) async
    test('test deleteExhibitionDevice', () async {
      // TODO
    });

    // Find a device
    //
    // Finds a device by id
    //
    //Future<ExhibitionDevice> findExhibitionDevice(String exhibitionId, String deviceId) async
    test('test findExhibitionDevice', () async {
      // TODO
    });

    // List devices
    //
    // List exhibition devices
    //
    //Future<BuiltList<ExhibitionDevice>> listExhibitionDevices(String exhibitionId, { String exhibitionGroupId, String deviceModelId }) async
    test('test listExhibitionDevices', () async {
      // TODO
    });

    // Updates device.
    //
    // Updates device.
    //
    //Future<ExhibitionDevice> updateExhibitionDevice(String exhibitionId, String deviceId, ExhibitionDevice exhibitionDevice) async
    test('test updateExhibitionDevice', () async {
      // TODO
    });

  });
}
