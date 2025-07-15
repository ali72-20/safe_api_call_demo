import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A module that provides dependencies related to network configuration using [Dio].
///
/// This class uses `@module` from `injectable` to define how to construct instances
/// that require parameters or need custom setup logic.
///
/// It defines how to provide:
/// - A configured [Dio] client
/// - A [PrettyDioLogger] interceptor for logging requests and responses
@module
abstract class DioProvider {
  /// Provides a singleton [Dio] instance with timeouts and logging interceptor.
  ///
  /// This method is annotated with `@lazySingleton`, meaning the [Dio] instance
  /// will only be created when it's first requested, and then reused throughout the app.
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    // Add logging interceptor
    dio.interceptors.add(providePretty());
    return dio;
  }

  /// Provides a configured [PrettyDioLogger] interceptor for debugging HTTP requests.
  ///
  /// Logs request headers, bodies, and responses only in debug mode (`kDebugMode`).
  @lazySingleton
  PrettyDioLogger providePretty() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode, // Automatically disables logging in release mode
    );
  }
}
