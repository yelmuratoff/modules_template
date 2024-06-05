import 'package:dio/dio.dart';

import '../interface/base_gateway.dart';

final class CoreGateway extends BaseGateway {
  factory CoreGateway({
    required EnvType envType,
    required Uri uri,
    // required String localeCode,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? headers,

    ///Disable SSL certificate verification
    bool overrideBadCert = false,
  }) {
    return CoreGateway._(
      envType: envType,
      overrideBadCert: overrideBadCert,
      uri: uri,
      headers: headers,
      interceptors: interceptors,
      dioBuilder: (dio) {
        return dio
          ..options.baseUrl = uri
              // .replace(
              //   path: '/api/$localeCode',
              // )
              .toString();
      },
    );
  }

  CoreGateway._({
    required super.envType,
    required super.uri,
    super.dioBuilder,
    super.interceptors,
    super.overrideBadCert,
    super.headers,
  });
}
