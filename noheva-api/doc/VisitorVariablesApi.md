# noheva_api.api.VisitorVariablesApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createVisitorVariable**](VisitorVariablesApi.md#createvisitorvariable) | **POST** /v1/exhibitions/{exhibitionId}/visitorVariables | Create a visitor variable
[**deleteVisitorVariable**](VisitorVariablesApi.md#deletevisitorvariable) | **DELETE** /v1/exhibitions/{exhibitionId}/visitorVariables/{visitorVariableId} | Deletes visitor variable.
[**findVisitorVariable**](VisitorVariablesApi.md#findvisitorvariable) | **GET** /v1/exhibitions/{exhibitionId}/visitorVariables/{visitorVariableId} | Find a visitor variable
[**listVisitorVariables**](VisitorVariablesApi.md#listvisitorvariables) | **GET** /v1/exhibitions/{exhibitionId}/visitorVariables | List Visitor variables
[**updateVisitorVariable**](VisitorVariablesApi.md#updatevisitorvariable) | **PUT** /v1/exhibitions/{exhibitionId}/visitorVariables/{visitorVariableId} | Updates visitor variable.


# **createVisitorVariable**
> VisitorVariable createVisitorVariable(exhibitionId, visitorVariable)

Create a visitor variable

Creates new exhibition visitor variable

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorVariablesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final VisitorVariable visitorVariable = ; // VisitorVariable | Payload

try {
    final response = api.createVisitorVariable(exhibitionId, visitorVariable);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorVariablesApi->createVisitorVariable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorVariable** | [**VisitorVariable**](VisitorVariable.md)| Payload | 

### Return type

[**VisitorVariable**](VisitorVariable.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteVisitorVariable**
> deleteVisitorVariable(exhibitionId, visitorVariableId)

Deletes visitor variable.

Delets exhibition visitor variable.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorVariablesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorVariableId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Visitor variable id

try {
    api.deleteVisitorVariable(exhibitionId, visitorVariableId);
} catch on DioError (e) {
    print('Exception when calling VisitorVariablesApi->deleteVisitorVariable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorVariableId** | **String**| Visitor variable id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findVisitorVariable**
> VisitorVariable findVisitorVariable(exhibitionId, visitorVariableId)

Find a visitor variable

Finds a visitor variable by id

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorVariablesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorVariableId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Visitor variable id

try {
    final response = api.findVisitorVariable(exhibitionId, visitorVariableId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorVariablesApi->findVisitorVariable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorVariableId** | **String**| Visitor variable id | 

### Return type

[**VisitorVariable**](VisitorVariable.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listVisitorVariables**
> BuiltList<VisitorVariable> listVisitorVariables(exhibitionId, name)

List Visitor variables

List exhibition Visitor variables

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorVariablesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String name = name_example; // String | query by variable name

try {
    final response = api.listVisitorVariables(exhibitionId, name);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorVariablesApi->listVisitorVariables: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **name** | **String**| query by variable name | [optional] 

### Return type

[**BuiltList&lt;VisitorVariable&gt;**](VisitorVariable.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateVisitorVariable**
> VisitorVariable updateVisitorVariable(exhibitionId, visitorVariableId, visitorVariable)

Updates visitor variable.

Updates visitor variable.

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getVisitorVariablesApi();
final String exhibitionId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | exhibition id
final String visitorVariableId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Visitor variable id
final VisitorVariable visitorVariable = ; // VisitorVariable | Payload

try {
    final response = api.updateVisitorVariable(exhibitionId, visitorVariableId, visitorVariable);
    print(response);
} catch on DioError (e) {
    print('Exception when calling VisitorVariablesApi->updateVisitorVariable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exhibitionId** | **String**| exhibition id | 
 **visitorVariableId** | **String**| Visitor variable id | 
 **visitorVariable** | [**VisitorVariable**](VisitorVariable.md)| Payload | 

### Return type

[**VisitorVariable**](VisitorVariable.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

