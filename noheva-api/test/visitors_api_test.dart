import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for VisitorsApi
void main() {
  final instance = NohevaApi().getVisitorsApi();

  group(VisitorsApi, () {
    // Create a visitor
    //
    // Creates a new exhibition visitor
    //
    //Future<Visitor> createVisitor(String exhibitionId, Visitor visitor) async
    test('test createVisitor', () async {
      // TODO
    });

    // Deletes a visitor.
    //
    // Deletes an exhibition visitor.
    //
    //Future deleteVisitor(String exhibitionId, String visitorId) async
    test('test deleteVisitor', () async {
      // TODO
    });

    // Find a visitor
    //
    // Finds a visitor by id
    //
    //Future<Visitor> findVisitor(String exhibitionId, String visitorId) async
    test('test findVisitor', () async {
      // TODO
    });

    // Find a visitor tag
    //
    // Finds a visitor tag by tagId
    //
    //Future<VisitorTag> findVisitorTag(String exhibitionId, String tagId) async
    test('test findVisitorTag', () async {
      // TODO
    });

    // List visitors
    //
    // List exhibition visitors
    //
    //Future<BuiltList<Visitor>> listVisitors(String exhibitionId, { String tagId, String email }) async
    test('test listVisitors', () async {
      // TODO
    });

    // Updates a visitor.
    //
    // Updates a visitor.
    //
    //Future<Visitor> updateVisitor(String exhibitionId, String visitorId, Visitor visitor) async
    test('test updateVisitor', () async {
      // TODO
    });

  });
}
