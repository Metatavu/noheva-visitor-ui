import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for VisitorVariablesApi
void main() {
  final instance = NohevaApi().getVisitorVariablesApi();

  group(VisitorVariablesApi, () {
    // Create a visitor variable
    //
    // Creates new exhibition visitor variable
    //
    //Future<VisitorVariable> createVisitorVariable(String exhibitionId, VisitorVariable visitorVariable) async
    test('test createVisitorVariable', () async {
      // TODO
    });

    // Deletes visitor variable.
    //
    // Delets exhibition visitor variable.
    //
    //Future deleteVisitorVariable(String exhibitionId, String visitorVariableId) async
    test('test deleteVisitorVariable', () async {
      // TODO
    });

    // Find a visitor variable
    //
    // Finds a visitor variable by id
    //
    //Future<VisitorVariable> findVisitorVariable(String exhibitionId, String visitorVariableId) async
    test('test findVisitorVariable', () async {
      // TODO
    });

    // List Visitor variables
    //
    // List exhibition Visitor variables
    //
    //Future<BuiltList<VisitorVariable>> listVisitorVariables(String exhibitionId, { String name }) async
    test('test listVisitorVariables', () async {
      // TODO
    });

    // Updates visitor variable.
    //
    // Updates visitor variable.
    //
    //Future<VisitorVariable> updateVisitorVariable(String exhibitionId, String visitorVariableId, VisitorVariable visitorVariable) async
    test('test updateVisitorVariable', () async {
      // TODO
    });

  });
}
