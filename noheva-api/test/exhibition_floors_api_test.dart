import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionFloorsApi
void main() {
  final instance = NohevaApi().getExhibitionFloorsApi();

  group(ExhibitionFloorsApi, () {
    // Create a floor
    //
    // Creates new exhibition floor
    //
    //Future<ExhibitionFloor> createExhibitionFloor(String exhibitionId, ExhibitionFloor exhibitionFloor) async
    test('test createExhibitionFloor', () async {
      // TODO
    });

    // Deletes floor.
    //
    // Delets exhibition floor.
    //
    //Future deleteExhibitionFloor(String exhibitionId, String floorId) async
    test('test deleteExhibitionFloor', () async {
      // TODO
    });

    // Find a floor
    //
    // Finds a floor by id
    //
    //Future<ExhibitionFloor> findExhibitionFloor(String exhibitionId, String floorId) async
    test('test findExhibitionFloor', () async {
      // TODO
    });

    // List floors
    //
    // List exhibition floors
    //
    //Future<BuiltList<ExhibitionFloor>> listExhibitionFloors(String exhibitionId) async
    test('test listExhibitionFloors', () async {
      // TODO
    });

    // Updates floor.
    //
    // Updates floor.
    //
    //Future<ExhibitionFloor> updateExhibitionFloor(String exhibitionId, String floorId, ExhibitionFloor exhibitionFloor) async
    test('test updateExhibitionFloor', () async {
      // TODO
    });

  });
}
