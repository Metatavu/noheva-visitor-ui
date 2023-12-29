import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for VisitorSessionsApi
void main() {
  final instance = NohevaApi().getVisitorSessionsApi();

  group(VisitorSessionsApi, () {
    // Create a visitor session
    //
    // Creates new exhibition visitor session
    //
    //Future<VisitorSession> createVisitorSession(String exhibitionId, VisitorSession visitorSession) async
    test('test createVisitorSession', () async {
      // TODO
    });

    // Create a visitor session
    //
    // Creates new exhibition visitor session
    //
    //Future<VisitorSessionV2> createVisitorSessionV2(String exhibitionId, VisitorSessionV2 visitorSessionV2) async
    test('test createVisitorSessionV2', () async {
      // TODO
    });

    // Deletes visitor session.
    //
    // Delets exhibition visitor session.
    //
    //Future deleteVisitorSession(String exhibitionId, String visitorSessionId) async
    test('test deleteVisitorSession', () async {
      // TODO
    });

    // Deletes visitor session.
    //
    // Delets exhibition visitor session.
    //
    //Future deleteVisitorSessionV2(String exhibitionId, String visitorSessionId) async
    test('test deleteVisitorSessionV2', () async {
      // TODO
    });

    // Find a visitor session
    //
    // Finds a visitor session by id
    //
    //Future<VisitorSession> findVisitorSession(String exhibitionId, String visitorSessionId) async
    test('test findVisitorSession', () async {
      // TODO
    });

    // Find a visitor session
    //
    // Finds a visitor session by id
    //
    //Future<VisitorSessionV2> findVisitorSessionV2(String exhibitionId, String visitorSessionId) async
    test('test findVisitorSessionV2', () async {
      // TODO
    });

    // List visitor sessions
    //
    // List exhibition visitor sessions
    //
    //Future<BuiltList<VisitorSession>> listVisitorSessions(String exhibitionId, { String tagId }) async
    test('test listVisitorSessions', () async {
      // TODO
    });

    // List visitor sessions
    //
    // List exhibition visitor sessions
    //
    //Future<BuiltList<VisitorSessionV2>> listVisitorSessionsV2(String exhibitionId, { String tagId, String modifiedAfter }) async
    test('test listVisitorSessionsV2', () async {
      // TODO
    });

    // Updates visitor session.
    //
    // Updates visitor session.
    //
    //Future<VisitorSession> updateVisitorSession(String exhibitionId, String visitorSessionId, VisitorSession visitorSession) async
    test('test updateVisitorSession', () async {
      // TODO
    });

    // Updates visitor session.
    //
    // Updates visitor session.
    //
    //Future<VisitorSessionV2> updateVisitorSessionV2(String exhibitionId, String visitorSessionId, VisitorSessionV2 visitorSessionV2) async
    test('test updateVisitorSessionV2', () async {
      // TODO
    });

  });
}
