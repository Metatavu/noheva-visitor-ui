//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:noheva_api/src/serializers.dart';
import 'package:noheva_api/src/auth/api_key_auth.dart';
import 'package:noheva_api/src/auth/basic_auth.dart';
import 'package:noheva_api/src/auth/bearer_auth.dart';
import 'package:noheva_api/src/auth/oauth.dart';
import 'package:noheva_api/src/api/content_versions_api.dart';
import 'package:noheva_api/src/api/device_data_api.dart';
import 'package:noheva_api/src/api/device_models_api.dart';
import 'package:noheva_api/src/api/devices_api.dart';
import 'package:noheva_api/src/api/exhibition_device_groups_api.dart';
import 'package:noheva_api/src/api/exhibition_devices_api.dart';
import 'package:noheva_api/src/api/exhibition_floors_api.dart';
import 'package:noheva_api/src/api/exhibition_pages_api.dart';
import 'package:noheva_api/src/api/exhibition_rooms_api.dart';
import 'package:noheva_api/src/api/exhibitions_api.dart';
import 'package:noheva_api/src/api/page_layouts_api.dart';
import 'package:noheva_api/src/api/rfid_antennas_api.dart';
import 'package:noheva_api/src/api/stored_files_api.dart';
import 'package:noheva_api/src/api/sub_layouts_api.dart';
import 'package:noheva_api/src/api/system_api.dart';
import 'package:noheva_api/src/api/visitor_sessions_api.dart';
import 'package:noheva_api/src/api/visitor_variables_api.dart';
import 'package:noheva_api/src/api/visitors_api.dart';

class NohevaApi {
  static const String basePath = r'http://localhost';

  final Dio dio;
  final Serializers serializers;

  NohevaApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get ContentVersionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ContentVersionsApi getContentVersionsApi() {
    return ContentVersionsApi(dio, serializers);
  }

  /// Get DeviceDataApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceDataApi getDeviceDataApi() {
    return DeviceDataApi(dio, serializers);
  }

  /// Get DeviceModelsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DeviceModelsApi getDeviceModelsApi() {
    return DeviceModelsApi(dio, serializers);
  }

  /// Get DevicesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DevicesApi getDevicesApi() {
    return DevicesApi(dio, serializers);
  }

  /// Get ExhibitionDeviceGroupsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionDeviceGroupsApi getExhibitionDeviceGroupsApi() {
    return ExhibitionDeviceGroupsApi(dio, serializers);
  }

  /// Get ExhibitionDevicesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionDevicesApi getExhibitionDevicesApi() {
    return ExhibitionDevicesApi(dio, serializers);
  }

  /// Get ExhibitionFloorsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionFloorsApi getExhibitionFloorsApi() {
    return ExhibitionFloorsApi(dio, serializers);
  }

  /// Get ExhibitionPagesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionPagesApi getExhibitionPagesApi() {
    return ExhibitionPagesApi(dio, serializers);
  }

  /// Get ExhibitionRoomsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionRoomsApi getExhibitionRoomsApi() {
    return ExhibitionRoomsApi(dio, serializers);
  }

  /// Get ExhibitionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ExhibitionsApi getExhibitionsApi() {
    return ExhibitionsApi(dio, serializers);
  }

  /// Get PageLayoutsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PageLayoutsApi getPageLayoutsApi() {
    return PageLayoutsApi(dio, serializers);
  }

  /// Get RfidAntennasApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  RfidAntennasApi getRfidAntennasApi() {
    return RfidAntennasApi(dio, serializers);
  }

  /// Get StoredFilesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  StoredFilesApi getStoredFilesApi() {
    return StoredFilesApi(dio, serializers);
  }

  /// Get SubLayoutsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SubLayoutsApi getSubLayoutsApi() {
    return SubLayoutsApi(dio, serializers);
  }

  /// Get SystemApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  SystemApi getSystemApi() {
    return SystemApi(dio, serializers);
  }

  /// Get VisitorSessionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  VisitorSessionsApi getVisitorSessionsApi() {
    return VisitorSessionsApi(dio, serializers);
  }

  /// Get VisitorVariablesApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  VisitorVariablesApi getVisitorVariablesApi() {
    return VisitorVariablesApi(dio, serializers);
  }

  /// Get VisitorsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  VisitorsApi getVisitorsApi() {
    return VisitorsApi(dio, serializers);
  }
}
