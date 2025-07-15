/// A contract that defines the structure for remote data source operations.
///
/// This abstract interface can be implemented by any class that performs
/// remote API calls, ensuring a consistent API surface for making network requests.
abstract interface class RemoteDataSourceContract {
  /// Demonstrates a remote API call.
  ///
  /// This method should be implemented to perform an actual network request
  /// and return a [String] result, such as a JSON string or a simple message.
  ///
  /// Returns a [Future<String>] that completes with the result of the API call.
  Future<String> apiCallDemo();
}
