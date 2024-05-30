# noheva_api.api.GroupContentVersionsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createGroupContentVersion**](GroupContentVersionsApi.md#creategroupcontentversion) | **POST** /exhibitions/{exhibitionId}/groupContentVersions | Create a group content version
[**deleteGroupContentVersion**](GroupContentVersionsApi.md#deletegroupcontentversion) | **DELETE** /exhibitions/{exhibitionId}/groupContentVersions/{groupContentVersionId} | Deletes group content version.
[**findGroupContentVersion**](GroupContentVersionsApi.md#findgroupcontentversion) | **GET** /exhibitions/{exhibitionId}/groupContentVersions/{groupContentVersionId} | Find a group content version
[**listGroupContentVersions**](GroupContentVersionsApi.md#listgroupcontentversions) | **GET** /exhibitions/{exhibitionId}/groupContentVersions | List group content versions
[**updateGroupContentVersion**](GroupContentVersionsApi.md#updategroupcontentversion) | **PUT** /exhibitions/{exhibitionId}/groupContentVersions/{groupContentVersionId} | Updates group content version.


# **createGroupContentVersion**
> GroupContentVersion createGroupContentVersion(exhibitionId, groupContentVersion)

Create a group content version

Creates new group content version

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getGroupContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final GroupContentVersion groupContentVersion = ; // GroupContentVersion | Payload

try {
    final response = api.createGroupContentVersion(exhibitionId, groupContentVersion);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GroupContentVersionsApi->createGroupContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **groupContentVersion** | [**GroupContentVersion**](GroupContentVersion.md)| Payload | 

### Return type

[**GroupContentVersion**](GroupContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteGroupContentVersion**
> deleteGroupContentVersion(exhibitionId, groupContentVersionId)

Deletes group content version.

Delets group content version.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getGroupContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String groupContentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | group content version id

try {
    api.deleteGroupContentVersion(exhibitionId, groupContentVersionId);
} catch on DioError (e) {
    print('Exception when calling GroupContentVersionsApi->deleteGroupContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **groupContentVersionId** | **String**| group content version id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findGroupContentVersion**
> GroupContentVersion findGroupContentVersion(exhibitionId, groupContentVersionId)

Find a group content version

Finds a group content version by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getGroupContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String groupContentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | group content version id

try {
    final response = api.findGroupContentVersion(exhibitionId, groupContentVersionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GroupContentVersionsApi->findGroupContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **groupContentVersionId** | **String**| group content version id | 

### Return type

[**GroupContentVersion**](GroupContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listGroupContentVersions**
> BuiltList<GroupContentVersion> listGroupContentVersions(exhibitionId, contentVersionId)

List group content versions

List group content versions

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getGroupContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String contentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | filter by content version id

try {
    final response = api.listGroupContentVersions(exhibitionId, contentVersionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GroupContentVersionsApi->listGroupContentVersions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **contentVersionId** | **String**| filter by content version id | [optional] 

### Return type

[**BuiltList&lt;GroupContentVersion&gt;**](GroupContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGroupContentVersion**
> GroupContentVersion updateGroupContentVersion(exhibitionId, groupContentVersionId, groupContentVersion)

Updates group content version.

Updates group content version.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getGroupContentVersionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String groupContentVersionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | group content version id
final GroupContentVersion groupContentVersion = ; // GroupContentVersion | Payload

try {
    final response = api.updateGroupContentVersion(exhibitionId, groupContentVersionId, groupContentVersion);
    print(response);
} catch on DioError (e) {
    print('Exception when calling GroupContentVersionsApi->updateGroupContentVersion: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **groupContentVersionId** | **String**| group content version id | 
 **groupContentVersion** | [**GroupContentVersion**](GroupContentVersion.md)| Payload | 

### Return type

[**GroupContentVersion**](GroupContentVersion.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

