import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for StoredFilesApi
void main() {
  final instance = NohevaApi().getStoredFilesApi();

  group(StoredFilesApi, () {
    // Deletes stored file
    //
    // Deletes stored file
    //
    //Future deleteStoredFile(String storedFileId) async
    test('test deleteStoredFile', () async {
      // TODO
    });

    // Find stored file
    //
    // Find stored file
    //
    //Future<StoredFile> findStoredFile(String storedFileId) async
    test('test findStoredFile', () async {
      // TODO
    });

    // List stored files
    //
    // List stored files
    //
    //Future<BuiltList<StoredFile>> listStoredFiles(String folder) async
    test('test listStoredFiles', () async {
      // TODO
    });

    // Updates stored file
    //
    // Updates stored file
    //
    //Future<StoredFile> updateStoredFile(String storedFileId, StoredFile storedFile) async
    test('test updateStoredFile', () async {
      // TODO
    });

  });
}
