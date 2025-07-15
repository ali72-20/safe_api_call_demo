import 'package:injectable/injectable.dart';
import 'package:untitled2/data/data_source/remote_data_source/remote_data_source_contract.dart';

import '../../api/api_manager.dart';

/// Implementation of [RemoteDataSourceContract] that handles remote API operations.
///
/// This class uses [ApiManager] to perform actual API calls.
/// It is annotated with `@Injectable(as: RemoteDataSourceContract)` to allow
/// dependency injection using the `injectable` package, which enables easy mocking
/// and swapping of implementations during testing or at runtime.
@Injectable(as: RemoteDataSourceContract)
class RemoteDataSourceImpl implements RemoteDataSourceContract {

  /// The API manager responsible for executing network requests.
  final ApiManager _apiManager;

  /// Constructor with required [ApiManager] dependency.
  ///
  /// This allows the API manager to be injected automatically using `injectable`.
  RemoteDataSourceImpl(this._apiManager);

  /// Calls the demo API method using [_apiManager] and returns the result.
  ///
  /// This demonstrates how a remote API call is delegated to a lower-level service.
  @override
  Future<String> apiCallDemo() async {
    return await _apiManager.safeApiCallDemo();
  }
}
