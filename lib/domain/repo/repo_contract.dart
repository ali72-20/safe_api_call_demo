import 'package:untitled2/core/api_result.dart';

/// A contract that defines the responsibilities of a Repository class
/// in the application's domain layer.
///
/// This abstract interface allows the domain layer to remain decoupled
/// from the actual data sources (remote, local, etc.), promoting
/// testability and flexibility.
abstract interface class RepoContract {
  /// Calls an API safely and returns the result wrapped in an [ApiResult].
  ///
  /// This method should implement error handling using a wrapper such as
  /// `safeApiCall`, and return either:
  /// - [OnSuccess] with the response data
  /// - [OnFailure] with the exception
  ///
  /// Returns a [Future] containing an [ApiResult<String>].
  Future<ApiResult<String>> getSafeApiCallDemo();
}
