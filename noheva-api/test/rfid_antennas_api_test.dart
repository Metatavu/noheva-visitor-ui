import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for RfidAntennasApi
void main() {
  final instance = NohevaApi().getRfidAntennasApi();

  group(RfidAntennasApi, () {
    // Create an RFID antenna
    //
    // Creates a new RFID antenna
    //
    //Future<RfidAntenna> createRfidAntenna(String exhibitionId, RfidAntenna rfidAntenna) async
    test('test createRfidAntenna', () async {
      // TODO
    });

    // Deletes RFID antenna.
    //
    // Deletes RFID antenna.
    //
    //Future deleteRfidAntenna(String exhibitionId, String rfidAntennaId) async
    test('test deleteRfidAntenna', () async {
      // TODO
    });

    // Find an RFID antenna
    //
    // Finds an RFID antenna by id
    //
    //Future<RfidAntenna> findRfidAntenna(String exhibitionId, String rfidAntennaId) async
    test('test findRfidAntenna', () async {
      // TODO
    });

    // List RFID antennas
    //
    // List RFID antennas
    //
    //Future<BuiltList<RfidAntenna>> listRfidAntennas(String exhibitionId, { String roomId, String deviceGroupId }) async
    test('test listRfidAntennas', () async {
      // TODO
    });

    // Updates RFID antenna.
    //
    // Updates RFID antenna.
    //
    //Future<RfidAntenna> updateRfidAntenna(String exhibitionId, String rfidAntennaId, RfidAntenna rfidAntenna) async
    test('test updateRfidAntenna', () async {
      // TODO
    });

  });
}
