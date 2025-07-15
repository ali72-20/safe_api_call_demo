/// A sealed class representing the result of an API call.
///
/// It is extended by two subclasses: [OnSuccess] and [OnFailure],
/// which represent successful and failed API responses respectively.
sealed class ApiResult<T> {}

/// Represents a successful result of an API call.
///
/// Contains the data returned from the API. The data is optional.
class OnSuccess<T> extends ApiResult<T> {
  /// The data returned from the API.
  final T? data;

  /// Constructor for [OnSuccess].
  ///
  /// [data] is the response payload which can be null.
  OnSuccess({this.data});
}

/// Represents a failed result of an API call.
///
/// Contains the exception that occurred during the API call.
class OnFailure<T> extends ApiResult<T> {
  /// The exception thrown during the API call.
  final Exception? exception;

  /// Constructor for [OnFailure].
  ///
  /// [exception] provides details about what went wrong.
  OnFailure({this.exception});
}
