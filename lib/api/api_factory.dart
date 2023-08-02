import "package:noheva_api/noheva_api.dart" as noheva_api;
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

    var api = noheva_api.NohevaApi(basePathOverride: apiBasePath);

    return api;
  }

  /// Gets System API
  Future<noheva_api.SystemApi> getSystemApi() {
    return _getApi().then((api) => api.getSystemApi());
  }
}
