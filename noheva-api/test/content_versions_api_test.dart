import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ContentVersionsApi
void main() {
  final instance = NohevaApi().getContentVersionsApi();

  group(ContentVersionsApi, () {
    // Create a content version
    //
    // Creates new content version
    //
    //Future<ContentVersion> createContentVersion(String exhibitionId, ContentVersion contentVersion) async
    test('test createContentVersion', () async {
      // TODO
    });

    // Deletes content version.
    //
    // Delets content version.
    //
    //Future deleteContentVersion(String exhibitionId, String contentVersionId) async
    test('test deleteContentVersion', () async {
      // TODO
    });

    // Find a content version
    //
    // Finds a content version by id
    //
    //Future<ContentVersion> findContentVersion(String exhibitionId, String contentVersionId) async
    test('test findContentVersion', () async {
      // TODO
    });

    // List content versions
    //
    // List content versions
    //
    //Future<BuiltList<ContentVersion>> listContentVersions(String exhibitionId, { String roomId, String deviceGroupId }) async
    test('test listContentVersions', () async {
      // TODO
    });

    // Updates content version.
    //
    // Updates content version.
    //
    //Future<ContentVersion> updateContentVersion(String exhibitionId, String contentVersionId, ContentVersion contentVersion) async
    test('test updateContentVersion', () async {
      // TODO
    });

  });
}
