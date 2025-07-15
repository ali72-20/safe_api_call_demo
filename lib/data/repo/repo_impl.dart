import 'package:injectable/injectable.dart';
import 'package:untitled2/core/api_result.dart';
import 'package:untitled2/core/safr_api_call.dart';
import 'package:untitled2/data/data_source/remote_data_source/remote_data_source_contract.dart';
import 'package:untitled2/domain/repo/repo_contract.dart';

/// Concrete implementation of [RepoContract] that interacts with the data layer.
///
/// This class delegates data operations to the [RemoteDataSourceContract] and wraps
/// API responses safely using [safeApiCall], returning results as [ApiResult].
///
/// Registered using `@Injectable(as: RepoContract)` so it can be injected
/// wherever [RepoContract] is required.
@Injectable(as: RepoContract)
class RepoImpl implements RepoContract {
  /// The remote data source used to fetch data from an API.
  final RemoteDataSourceContract _dataSourceContract;

  /// Constructor that receives the required [RemoteDataSourceContract] dependency.
  ///
  /// Enables clean separation of concerns and easy mocking in unit tests.
  RepoImpl(this._dataSourceContract);

  /// Calls the demo API and wraps the result using [safeApiCall].
  ///
  /// This ensures any exceptions are caught and returned as [OnFailure],
  /// while successful responses are returned as [OnSuccess].
  ///
  /// Returns an [ApiResult<String>] containing either the data or an error.
  @override
  Future<ApiResult<String>> getSafeApiCallDemo() async {
    return await safeApiCall<String>(() async {
      final response = await _dataSourceContract.apiCallDemo();
      return response;
    });
  }
}
