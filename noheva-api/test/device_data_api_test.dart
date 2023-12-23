import 'package:test/test.dart';
import 'package:noheva_api/noheva_api.dart';


/// tests for DeviceDataApi
void main() {
  final instance = NohevaApi().getDeviceDataApi();

  group(DeviceDataApi, () {
    // List layouts for this device.
    //
    // List device layouts for this device. Only devices access this endpoint.
    //
    //Future<BuiltList<DeviceLayout>> listDeviceDataLayouts(String deviceId) async
    test('test listDeviceDataLayouts', () async {
      // TODO
    });

    // List pages for this device.
    //
    // List pages for this device. Only devices access this endpoint.
    //
    //Future<BuiltList<DevicePage>> listDeviceDataPages(String deviceId) async
    test('test listDeviceDataPages', () async {
      // TODO
    });

  });
}
