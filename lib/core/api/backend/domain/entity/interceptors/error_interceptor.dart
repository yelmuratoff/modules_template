import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor implements Interceptor {
  ErrorInterceptor({
    required this.onAuthError,
    this.authErrorCodes = const [401, 403],
  });

  List<int> authErrorCodes;

  final ValueChanged<DioException> onAuthError;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final isAuthError = authErrorCodes.contains(
      error.response?.statusCode,
    );
    if (isAuthError) {
      onAuthError(error);
    }
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
