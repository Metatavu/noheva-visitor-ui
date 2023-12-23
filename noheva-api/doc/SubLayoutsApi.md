# noheva_api.api.SubLayoutsApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSubLayout**](SubLayoutsApi.md#createsublayout) | **POST** /v1/subLayouts | Create a sub layout
[**deleteSubLayout**](SubLayoutsApi.md#deletesublayout) | **DELETE** /v1/subLayouts/{subLayoutId} | Deletes sub layout.
[**findSubLayout**](SubLayoutsApi.md#findsublayout) | **GET** /v1/subLayouts/{subLayoutId} | Find a sub layout
[**listSubLayouts**](SubLayoutsApi.md#listsublayouts) | **GET** /v1/subLayouts | List sub layouts
[**updateSubLayout**](SubLayoutsApi.md#updatesublayout) | **PUT** /v1/subLayouts/{subLayoutId} | Updates sub layout.


# **createSubLayout**
> SubLayout createSubLayout(subLayout)

Create a sub layout

Creates new sub layout

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getSubLayoutsApi();
final SubLayout subLayout = ; // SubLayout | Payload

try {
    final response = api.createSubLayout(subLayout);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubLayoutsApi->createSubLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subLayout** | [**SubLayout**](SubLayout.md)| Payload | 

### Return type

[**SubLayout**](SubLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSubLayout**
> deleteSubLayout(subLayoutId)

Deletes sub layout.

Delets sub layout.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getSubLayoutsApi();
final String subLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Sub layout id

try {
    api.deleteSubLayout(subLayoutId);
} catch on DioError (e) {
    print('Exception when calling SubLayoutsApi->deleteSubLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subLayoutId** | **String**| Sub layout id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findSubLayout**
> SubLayout findSubLayout(subLayoutId)

Find a sub layout

Finds a sub layout by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getSubLayoutsApi();
final String subLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Sub layout id

try {
    final response = api.findSubLayout(subLayoutId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubLayoutsApi->findSubLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subLayoutId** | **String**| Sub layout id | 

### Return type

[**SubLayout**](SubLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSubLayouts**
> BuiltList<SubLayout> listSubLayouts()

List sub layouts

List sub layouts

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getSubLayoutsApi();

try {
    final response = api.listSubLayouts();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubLayoutsApi->listSubLayouts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;SubLayout&gt;**](SubLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateSubLayout**
> SubLayout updateSubLayout(subLayoutId, subLayout)

Updates sub layout.

Updates sub layout.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getSubLayoutsApi();
final String subLayoutId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Sub layout id
final SubLayout subLayout = ; // SubLayout | Payload

try {
    final response = api.updateSubLayout(subLayoutId, subLayout);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubLayoutsApi->updateSubLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subLayoutId** | **String**| Sub layout id | 
 **subLayout** | [**SubLayout**](SubLayout.md)| Payload | 

### Return type

[**SubLayout**](SubLayout.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

