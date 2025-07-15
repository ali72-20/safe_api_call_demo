import 'package:injectable/injectable.dart';
import 'package:untitled2/core/api_result.dart';

import '../repo/repo_contract.dart';

/// A use case class that orchestrates the business logic of calling an API safely.
///
/// This class belongs to the domain layer and acts as an intermediary between
/// the UI (presentation layer) and the repository (data layer).
///
/// Annotated with `@injectable` to support dependency injection using `injectable`.
@injectable
class UseCase {
  /// The repository contract used to fetch data from the data layer.
  final RepoContract _repoContract;

  /// Constructor with dependency injection of [RepoContract].
  ///
  /// This allows the use case to remain decoupled from the actual implementation
  /// of the repository, enabling easier testing and maintainability.
  UseCase(this._repoContract);

  /// Executes the use case logic to fetch data from the API safely.
  ///
  /// Delegates the call to the repository and returns the result
  /// wrapped in an [ApiResult] (`OnSuccess` or `OnFailure`).
  ///
  /// Returns a [Future<ApiResult<String>>].
  Future<ApiResult<String>> getSafeApiCallDemo() async {
    return await _repoContract.getSafeApiCallDemo();
  }
}
