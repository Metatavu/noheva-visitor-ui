import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for PageLayoutsApi
void main() {
  final instance = NohevaApi().getPageLayoutsApi();

  group(PageLayoutsApi, () {
    // Create a page layout
    //
    // Creates new page layout
    //
    //Future<PageLayout> createPageLayout(PageLayout pageLayout) async
    test('test createPageLayout', () async {
      // TODO
    });

    // Deletes page layout.
    //
    // Delets page layout.
    //
    //Future deletePageLayout(String pageLayoutId) async
    test('test deletePageLayout', () async {
      // TODO
    });

    // Find a page layout
    //
    // Finds a page layout by id
    //
    //Future<PageLayout> findPageLayout(String pageLayoutId) async
    test('test findPageLayout', () async {
      // TODO
    });

    // List page layouts
    //
    // List page layouts
    //
    //Future<BuiltList<PageLayout>> listPageLayouts({ String deviceModelId, String screenOrientation }) async
    test('test listPageLayouts', () async {
      // TODO
    });

    // Updates page layout.
    //
    // Updates page layout.
    //
    //Future<PageLayout> updatePageLayout(String pageLayoutId, PageLayout pageLayout) async
    test('test updatePageLayout', () async {
      // TODO
    });

  });
}
