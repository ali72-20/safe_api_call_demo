import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled2/core/api_result.dart';
import 'package:untitled2/domain/use_case/use_case.dart';
import 'package:untitled2/presentation/ui/screen/managers/events.dart';

import 'States.dart';

/// A Cubit-based ViewModel that handles the state management for the API call.
///
/// This class uses the `UseCase` to perform business logic, and emits different
/// [State] subclasses to reflect the current status (initial, loading, success, failure).
///
/// Registered with `@injectable` for dependency injection using the `injectable` package.
@injectable
class ViewModel extends Cubit<States> {
  /// The use case responsible for executing the API call logic.
  final UseCase _useCase;

  /// Initializes the ViewModel with [InitialState] as the starting state.
  ViewModel(this._useCase) : super(InitialState());

  /// Public method to trigger the API call.
  ///
  /// Emits:
  /// - [OnLoadingState] before starting the call.
  /// - [OnSuccessState] with data on success.
  /// - [OnFailureState] with exception on failure.
  _callApi() async {
    emit(OnLoadingState());
    final result = await _useCase.getSafeApiCallDemo();

    switch (result) {
      case OnSuccess<String>():
        emit(OnSuccessState(data: result.data));
      case OnFailure<String>():
        emit(OnFailureState(exception: result.exception));
    }
  }

  onEvent(Event event) {
    switch (event) {
      case SafeApiCallEvent():
        _callApi();
    }
  }
}
