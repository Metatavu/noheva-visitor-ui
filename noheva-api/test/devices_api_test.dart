import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for DevicesApi
void main() {
  final instance = NohevaApi().getDevicesApi();

  group(DevicesApi, () {
    // Creates a Device
    //
    // Creates a new Device
    //
    //Future<Device> createDevice(DeviceRequest deviceRequest) async
    test('test createDevice', () async {
      // TODO
    });

    // Deletes Device
    //
    // Deletes Device
    //
    //Future deleteDevice(String deviceId) async
    test('test deleteDevice', () async {
      // TODO
    });

    // Find a Device.
    //
    // Finds a Device by id.
    //
    //Future<Device> findDevice(String deviceId) async
    test('test findDevice', () async {
      // TODO
    });

    // Gets device key
    //
    // Gets device key if device is approved.
    //
    //Future<DeviceKey> getDeviceKey(String deviceId) async
    test('test getDeviceKey', () async {
      // TODO
    });

    // List devices.
    //
    // Lists devices.
    //
    //Future<BuiltList<Device>> listDevices({ DeviceStatus status, DeviceApprovalStatus approvalStatus }) async
    test('test listDevices', () async {
      // TODO
    });

    // Updates Device
    //
    // Updates Device
    //
    //Future<Device> updateDevice(String deviceId, Device device) async
    test('test updateDevice', () async {
      // TODO
    });

  });
}
