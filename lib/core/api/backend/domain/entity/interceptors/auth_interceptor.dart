import 'package:dio/dio.dart';

import '../../../../../../shared/value_objects/auth_vo.dart';

class AuthInterceptor implements Interceptor {
  AuthInterceptor({required this.authVo});

  final AuthVo? Function() authVo;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final uri = options.uri;
    final vo = authVo();
    options.headers.addAll(
      {
        if (vo?.token != null) 'Authorization': 'Bearer ${vo!.token!}',
        // 'Authorization': 'Bearer TOKEN',
      },
    );

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
