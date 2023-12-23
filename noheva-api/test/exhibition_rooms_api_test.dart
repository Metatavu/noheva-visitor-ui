import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionRoomsApi
void main() {
  final instance = NohevaApi().getExhibitionRoomsApi();

  group(ExhibitionRoomsApi, () {
    // Create a room
    //
    // Creates new exhibition room
    //
    //Future<ExhibitionRoom> createExhibitionRoom(String exhibitionId, ExhibitionRoom exhibitionRoom) async
    test('test createExhibitionRoom', () async {
      // TODO
    });

    // Deletes room.
    //
    // Delets exhibition room.
    //
    //Future deleteExhibitionRoom(String exhibitionId, String roomId) async
    test('test deleteExhibitionRoom', () async {
      // TODO
    });

    // Find a room
    //
    // Finds a room by id
    //
    //Future<ExhibitionRoom> findExhibitionRoom(String exhibitionId, String roomId) async
    test('test findExhibitionRoom', () async {
      // TODO
    });

    // List rooms
    //
    // List exhibition rooms
    //
    //Future<BuiltList<ExhibitionRoom>> listExhibitionRooms(String exhibitionId, { String floorId }) async
    test('test listExhibitionRooms', () async {
      // TODO
    });

    // Updates room.
    //
    // Updates room.
    //
    //Future<ExhibitionRoom> updateExhibitionRoom(String exhibitionId, String roomId, ExhibitionRoom exhibitionRoom) async
    test('test updateExhibitionRoom', () async {
      // TODO
    });

  });
}
