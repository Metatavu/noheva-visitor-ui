import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionDeviceGroupsApi
void main() {
  final instance = NohevaApi().getExhibitionDeviceGroupsApi();

  group(ExhibitionDeviceGroupsApi, () {
    // Create a device group
    //
    // Creates new exhibition device group
    //
    //Future<ExhibitionDeviceGroup> createExhibitionDeviceGroup(String exhibitionId, { String sourceDeviceGroupId, ExhibitionDeviceGroup exhibitionDeviceGroup }) async
    test('test createExhibitionDeviceGroup', () async {
      // TODO
    });

    // Deletes device group.
    //
    // Delets exhibition device group.
    //
    //Future deleteExhibitionDeviceGroup(String exhibitionId, String deviceGroupId) async
    test('test deleteExhibitionDeviceGroup', () async {
      // TODO
    });

    // Find a device group
    //
    // Finds a device group by id
    //
    //Future<ExhibitionDeviceGroup> findExhibitionDeviceGroup(String exhibitionId, String deviceGroupId) async
    test('test findExhibitionDeviceGroup', () async {
      // TODO
    });

    // List device groups
    //
    // List exhibition device groups
    //
    //Future<BuiltList<ExhibitionDeviceGroup>> listExhibitionDeviceGroups(String exhibitionId, { String roomId }) async
    test('test listExhibitionDeviceGroups', () async {
      // TODO
    });

    // Updates device group.
    //
    // Updates device group.
    //
    //Future<ExhibitionDeviceGroup> updateExhibitionDeviceGroup(String exhibitionId, String deviceGroupId, ExhibitionDeviceGroup exhibitionDeviceGroup) async
    test('test updateExhibitionDeviceGroup', () async {
      // TODO
    });

  });
}
