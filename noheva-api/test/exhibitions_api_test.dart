import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionsApi
void main() {
  final instance = NohevaApi().getExhibitionsApi();

  group(ExhibitionsApi, () {
    // Create a exhibition.
    //
    // Creates new exhibition
    //
    //Future<Exhibition> createExhibition({ String sourceExhibitionId, Exhibition exhibition }) async
    test('test createExhibition', () async {
      // TODO
    });

    // Deletes exhibition.
    //
    // Delets exhibition
    //
    //Future deleteExhibition(String exhibitionId) async
    test('test deleteExhibition', () async {
      // TODO
    });

    // Find a exhibition.
    //
    // Finds a exhibition by id
    //
    //Future<Exhibition> findExhibition(String exhibitionId) async
    test('test findExhibition', () async {
      // TODO
    });

    // List exhibitions.
    //
    // Lists a exhibition
    //
    //Future<BuiltList<Exhibition>> listExhibitions() async
    test('test listExhibitions', () async {
      // TODO
    });

    // Updates exhibition.
    //
    // Updates exhibition
    //
    //Future<Exhibition> updateExhibition(String exhibitionId, Exhibition exhibition) async
    test('test updateExhibition', () async {
      // TODO
    });

  });
}
