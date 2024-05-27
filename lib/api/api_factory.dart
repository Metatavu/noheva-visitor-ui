import "package:noheva_api/noheva_api.dart" as noheva_api;
import "package:noheva_visitor_ui/database/dao/key_dao.dart";
import "../main.dart";

/// API Factory
/// Provides initialized API Clients
class ApiFactory {
  ApiFactory._();

  factory ApiFactory() => _instance;
  static final ApiFactory _instance = ApiFactory._();

  /// Initializes API Client
  Future<noheva_api.NohevaApi> _getApi() async {
    var apiBasePath = configuration.getApiBasePath();
    String? deviceKey = await keyDao.getDeviceKey();
    var api = noheva_api.NohevaApi(basePathOverride: apiBasePath);

    if (deviceKey != null) {
      api.dio.options.headers.addAll({"X-DEVICE-KEY": deviceKey});
    }
    api.dio.options.connectTimeout = null;

    return api;
  }

  /// Gets System API
  Future<noheva_api.SystemApi> getSystemApi() {
    return _getApi().then((api) => api.getSystemApi());
  }

  /// Gets Devices API
  Future<noheva_api.DevicesApi> getDevicesApi() {
    return _getApi().then((api) => api.getDevicesApi());
  }

  /// Gets DeviceData API
  Future<noheva_api.DeviceDataApi> getDeviceDataApi() {
    return _getApi().then((api) => api.getDeviceDataApi());
  }
}
