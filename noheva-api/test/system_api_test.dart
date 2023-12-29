import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for SystemApi
void main() {
  final instance = NohevaApi().getSystemApi();

  group(SystemApi, () {
    // System memory
    //
    //Future<SystemMemory> memory() async
    test('test memory', () async {
      // TODO
    });

    // System ping endpoint
    //
    //Future<JsonObject> ping() async
    test('test ping', () async {
      // TODO
    });

  });
}
