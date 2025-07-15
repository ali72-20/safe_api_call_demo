/// Base class representing the state of a process, such as an API call or business logic.
///
/// This class is extended by specific state classes like [InitialState], [OnLoadingState],
/// [OnSuccessState], and [OnFailureState], which describe different points in the lifecycle.
abstract class States {}

/// Represents the initial state before any action has taken place.
///
/// Typically used when the screen or logic has just been initialized.
final class InitialState extends States {}

/// Represents a loading state, usually while a process is running.
///
/// Useful for showing loading spinners or progress indicators in the UI.
final class OnLoadingState extends States {}

/// Represents a successful state where the operation has completed and returned data.
///
/// Generic type [T] allows this class to carry any type of response data.
final class OnSuccessState<T> extends States {
  /// The result data of the successful operation.
  final T? data;

  /// Constructor for [OnSuccessState].
  ///
  /// [data] is optional and represents the successful result of the operation.
  OnSuccessState({this.data});
}

/// Represents a failure state where an exception occurred during the process.
///
/// This state contains an optional [exception] that can be used for error handling or display.
final class OnFailureState extends States {
  /// The exception that caused the failure.
  final Exception? exception;

  /// Constructor for [OnFailureState].
  ///
  /// [exception] provides details about the error.
  OnFailureState({this.exception});
}
