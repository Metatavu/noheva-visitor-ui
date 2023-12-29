# noheva_api.api.VisitorSessionsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createVisitorSession**](VisitorSessionsApi.md#createvisitorsession) | **POST** /v1/exhibitions/{exhibitionId}/visitorSessions | Create a visitor session
[**createVisitorSessionV2**](VisitorSessionsApi.md#createvisitorsessionv2) | **POST** /v2/exhibitions/{exhibitionId}/visitorSessions | Create a visitor session
[**deleteVisitorSession**](VisitorSessionsApi.md#deletevisitorsession) | **DELETE** /v1/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Deletes visitor session.
[**deleteVisitorSessionV2**](VisitorSessionsApi.md#deletevisitorsessionv2) | **DELETE** /v2/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Deletes visitor session.
[**findVisitorSession**](VisitorSessionsApi.md#findvisitorsession) | **GET** /v1/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Find a visitor session
[**findVisitorSessionV2**](VisitorSessionsApi.md#findvisitorsessionv2) | **GET** /v2/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Find a visitor session
[**listVisitorSessions**](VisitorSessionsApi.md#listvisitorsessions) | **GET** /v1/exhibitions/{exhibitionId}/visitorSessions | List visitor sessions
[**listVisitorSessionsV2**](VisitorSessionsApi.md#listvisitorsessionsv2) | **GET** /v2/exhibitions/{exhibitionId}/visitorSessions | List visitor sessions
[**updateVisitorSession**](VisitorSessionsApi.md#updatevisitorsession) | **PUT** /v1/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Updates visitor session.
[**updateVisitorSessionV2**](VisitorSessionsApi.md#updatevisitorsessionv2) | **PUT** /v2/exhibitions/{exhibitionId}/visitorSessions/{visitorSessionId} | Updates visitor session.


# **createVisitorSession**
> VisitorSession createVisitorSession(exhibitionId, visitorSession)

Create a visitor session

Creates new exhibition visitor session

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final VisitorSession visitorSession = ; // VisitorSession | Payload

try {
    final response = api.createVisitorSession(exhibitionId, visitorSession);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->createVisitorSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSession** | [**VisitorSession**](VisitorSession.md)| Payload | 

### Return type

[**VisitorSession**](VisitorSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createVisitorSessionV2**
> VisitorSessionV2 createVisitorSessionV2(exhibitionId, visitorSessionV2)

Create a visitor session

Creates new exhibition visitor session

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final VisitorSessionV2 visitorSessionV2 = ; // VisitorSessionV2 | Payload

try {
    final response = api.createVisitorSessionV2(exhibitionId, visitorSessionV2);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->createVisitorSessionV2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionV2** | [**VisitorSessionV2**](VisitorSessionV2.md)| Payload | 

### Return type

[**VisitorSessionV2**](VisitorSessionV2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVisitorSession**
> deleteVisitorSession(exhibitionId, visitorSessionId)

Deletes visitor session.

Delets exhibition visitor session.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id

try {
    api.deleteVisitorSession(exhibitionId, visitorSessionId);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->deleteVisitorSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVisitorSessionV2**
> deleteVisitorSessionV2(exhibitionId, visitorSessionId)

Deletes visitor session.

Delets exhibition visitor session.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id

try {
    api.deleteVisitorSessionV2(exhibitionId, visitorSessionId);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->deleteVisitorSessionV2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findVisitorSession**
> VisitorSession findVisitorSession(exhibitionId, visitorSessionId)

Find a visitor session

Finds a visitor session by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id

try {
    final response = api.findVisitorSession(exhibitionId, visitorSessionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->findVisitorSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 

### Return type

[**VisitorSession**](VisitorSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findVisitorSessionV2**
> VisitorSessionV2 findVisitorSessionV2(exhibitionId, visitorSessionId)

Find a visitor session

Finds a visitor session by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id

try {
    final response = api.findVisitorSessionV2(exhibitionId, visitorSessionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->findVisitorSessionV2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 

### Return type

[**VisitorSessionV2**](VisitorSessionV2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVisitorSessions**
> BuiltList<VisitorSession> listVisitorSessions(exhibitionId, tagId)

List visitor sessions

List exhibition visitor sessions

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String tagId = tagId_example; // String | query by RFID tag

try {
    final response = api.listVisitorSessions(exhibitionId, tagId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->listVisitorSessions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **tagId** | **String**| query by RFID tag | [optional] 

### Return type

[**BuiltList&lt;VisitorSession&gt;**](VisitorSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVisitorSessionsV2**
> BuiltList<VisitorSessionV2> listVisitorSessionsV2(exhibitionId, tagId, modifiedAfter)

List visitor sessions

List exhibition visitor sessions

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String tagId = tagId_example; // String | query by RFID tag
final String modifiedAfter = modifiedAfter_example; // String | filter list by modification time

try {
    final response = api.listVisitorSessionsV2(exhibitionId, tagId, modifiedAfter);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->listVisitorSessionsV2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **tagId** | **String**| query by RFID tag | [optional] 
 **modifiedAfter** | **String**| filter list by modification time | [optional] 

### Return type

[**BuiltList&lt;VisitorSessionV2&gt;**](VisitorSessionV2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVisitorSession**
> VisitorSession updateVisitorSession(exhibitionId, visitorSessionId, visitorSession)

Updates visitor session.

Updates visitor session.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id
final VisitorSession visitorSession = ; // VisitorSession | Payload

try {
    final response = api.updateVisitorSession(exhibitionId, visitorSessionId, visitorSession);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->updateVisitorSession: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 
 **visitorSession** | [**VisitorSession**](VisitorSession.md)| Payload | 

### Return type

[**VisitorSession**](VisitorSession.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVisitorSessionV2**
> VisitorSessionV2 updateVisitorSessionV2(exhibitionId, visitorSessionId, visitorSessionV2)

Updates visitor session.

Updates visitor session.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorSessionsApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorSessionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | visitor session id
final VisitorSessionV2 visitorSessionV2 = ; // VisitorSessionV2 | Payload

try {
    final response = api.updateVisitorSessionV2(exhibitionId, visitorSessionId, visitorSessionV2);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorSessionsApi->updateVisitorSessionV2: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorSessionId** | **String**| visitor session id | 
 **visitorSessionV2** | [**VisitorSessionV2**](VisitorSessionV2.md)| Payload | 

### Return type

[**VisitorSessionV2**](VisitorSessionV2.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

