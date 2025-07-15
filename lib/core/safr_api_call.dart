import 'package:untitled2/core/api_result.dart';

/// Executes an API call safely and wraps the result in an [ApiResult].
///
/// This function ensures that any exceptions thrown during the API call
/// are caught and returned as an [OnFailure] object, while successful
/// results are returned as an [OnSuccess] object.
///
/// Example usage:
/// ```dart
/// final result = await safeApiCall(() => apiService.getUser());
/// if (result is OnSuccess) {
///   print(result.data);
/// } else if (result is OnFailure) {
///   print(result.exception);
/// }
/// ```
///
/// [apiCall] is a function that returns a [Future] of type [T].
///
/// Returns an [ApiResult<T>] which will be either [OnSuccess] or [OnFailure].
Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    return OnSuccess<T>(data: response);
  } catch (e) {
    // Wrap any error into an Exception if it's not already one
    return OnFailure<T>(
        exception: e is Exception ? e : Exception(e.toString()));
  }
}
