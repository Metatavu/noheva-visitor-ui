import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for ExhibitionPagesApi
void main() {
  final instance = NohevaApi().getExhibitionPagesApi();

  group(ExhibitionPagesApi, () {
    // Create a page
    //
    // Creates new exhibition page
    //
    //Future<ExhibitionPage> createExhibitionPage(String exhibitionId, ExhibitionPage exhibitionPage) async
    test('test createExhibitionPage', () async {
      // TODO
    });

    // Deletes page.
    //
    // Delets exhibition page.
    //
    //Future deleteExhibitionPage(String exhibitionId, String pageId) async
    test('test deleteExhibitionPage', () async {
      // TODO
    });

    // Find a page
    //
    // Finds a page by id
    //
    //Future<ExhibitionPage> findExhibitionPage(String exhibitionId, String pageId) async
    test('test findExhibitionPage', () async {
      // TODO
    });

    // List pages
    //
    // List exhibition pages
    //
    //Future<BuiltList<ExhibitionPage>> listExhibitionPages(String exhibitionId, { String contentVersionId, String exhibitionDeviceId, String pageLayoutId }) async
    test('test listExhibitionPages', () async {
      // TODO
    });

    // Updates page.
    //
    // Updates page.
    //
    //Future<ExhibitionPage> updateExhibitionPage(String exhibitionId, String pageId, ExhibitionPage exhibitionPage) async
    test('test updateExhibitionPage', () async {
      // TODO
    });

  });
}
