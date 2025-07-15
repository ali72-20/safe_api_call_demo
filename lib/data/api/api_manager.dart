import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import 'api_const.dart';

part 'api_manager.g.dart';

/// A Retrofit-powered API manager for handling HTTP requests.
///
/// This class is marked as a singleton using `@singleton`, ensuring a single instance
/// throughout the app. It is also integrated with `injectable` for dependency injection.
///
/// The [baseUrl] is set to `http://localhost:8080`, which should typically be replaced
/// with your actual backend URL.
///
/// This class defines API endpoints and generates implementation code
/// via the `retrofit` code generator (`build_runner`).
@singleton
@injectable
@RestApi(baseUrl: ApiBaseUrl.baseUrl)
abstract class ApiManager {
  /// Factory constructor that creates an implementation using [Dio].
  ///
  /// This is required for Retrofit to work with code generation.
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  /// A demo GET API call to the `/SafeApiCallResult` endpoint.
  ///
  /// This function simulates a safe API call and returns a [String] response.
  /// Can be used for testing network connectivity, response wrapping, etc.
  @GET(ApiEndpoints.safeApiCallDemo)
  Future<String> safeApiCallDemo();
}
