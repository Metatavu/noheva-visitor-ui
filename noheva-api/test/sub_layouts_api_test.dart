import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for SubLayoutsApi
void main() {
  final instance = NohevaApi().getSubLayoutsApi();

  group(SubLayoutsApi, () {
    // Create a sub layout
    //
    // Creates new sub layout
    //
    //Future<SubLayout> createSubLayout(SubLayout subLayout) async
    test('test createSubLayout', () async {
      // TODO
    });

    // Deletes sub layout.
    //
    // Delets sub layout.
    //
    //Future deleteSubLayout(String subLayoutId) async
    test('test deleteSubLayout', () async {
      // TODO
    });

    // Find a sub layout
    //
    // Finds a sub layout by id
    //
    //Future<SubLayout> findSubLayout(String subLayoutId) async
    test('test findSubLayout', () async {
      // TODO
    });

    // List sub layouts
    //
    // List sub layouts
    //
    //Future<BuiltList<SubLayout>> listSubLayouts() async
    test('test listSubLayouts', () async {
      // TODO
    });

    // Updates sub layout.
    //
    // Updates sub layout.
    //
    //Future<SubLayout> updateSubLayout(String subLayoutId, SubLayout subLayout) async
    test('test updateSubLayout', () async {
      // TODO
    });

  });
}
