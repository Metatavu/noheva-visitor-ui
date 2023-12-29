# noheva_api.api.StoredFilesApi

## Load the API package
```dart
import 'package:noheva_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteStoredFile**](StoredFilesApi.md#deletestoredfile) | **DELETE** /v1/storedFiles/{storedFileId} | Deletes stored file
[**findStoredFile**](StoredFilesApi.md#findstoredfile) | **GET** /v1/storedFiles/{storedFileId} | Find stored file
[**listStoredFiles**](StoredFilesApi.md#liststoredfiles) | **GET** /v1/storedFiles | List stored files
[**updateStoredFile**](StoredFilesApi.md#updatestoredfile) | **PUT** /v1/storedFiles/{storedFileId} | Updates stored file


# **deleteStoredFile**
> deleteStoredFile(storedFileId)

Deletes stored file

Deletes stored file

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getStoredFilesApi();
final String storedFileId = storedFileId_example; // String | stored file id

try {
    api.deleteStoredFile(storedFileId);
} catch on DioError (e) {
    print('Exception when calling StoredFilesApi->deleteStoredFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storedFileId** | **String**| stored file id | 

### Return type

void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **findStoredFile**
> StoredFile findStoredFile(storedFileId)

Find stored file

Find stored file

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getStoredFilesApi();
final String storedFileId = storedFileId_example; // String | stored file id

try {
    final response = api.findStoredFile(storedFileId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling StoredFilesApi->findStoredFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storedFileId** | **String**| stored file id | 

### Return type

[**StoredFile**](StoredFile.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStoredFiles**
> BuiltList<StoredFile> listStoredFiles(folder)

List stored files

List stored files

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getStoredFilesApi();
final String folder = folder_example; // String | 

try {
    final response = api.listStoredFiles(folder);
    print(response);
} catch on DioError (e) {
    print('Exception when calling StoredFilesApi->listStoredFiles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **folder** | **String**|  | 

### Return type

[**BuiltList&lt;StoredFile&gt;**](StoredFile.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateStoredFile**
> StoredFile updateStoredFile(storedFileId, storedFile)

Updates stored file

Updates stored file

### Example
```dart
import 'package:noheva_api/api.dart';
// TODO Configure HTTP basic authorization: bearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearerAuth').password = 'YOUR_PASSWORD';

final api = NohevaApi().getStoredFilesApi();
final String storedFileId = storedFileId_example; // String | stored file id
final StoredFile storedFile = ; // StoredFile | Payload

try {
    final response = api.updateStoredFile(storedFileId, storedFile);
    print(response);
} catch on DioError (e) {
    print('Exception when calling StoredFilesApi->updateStoredFile: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **storedFileId** | **String**| stored file id | 
 **storedFile** | [**StoredFile**](StoredFile.md)| Payload | 

### Return type

[**StoredFile**](StoredFile.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

