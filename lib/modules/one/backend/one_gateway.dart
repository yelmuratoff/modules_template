import 'package:dio/dio.dart';

import '../../../core/api/gateway/domain/interface/base_gateway.dart';

final class OneGateway extends BaseGateway {
  factory OneGateway({
    required EnvType envType,
    required Uri uri,
    // required String localeCode,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? headers,

    ///Disable SSL certificate verification
    bool overrideBadCert = false,
  }) {
    return OneGateway._(
      envType: envType,
      overrideBadCert: overrideBadCert,
      uri: uri,
      interceptors: interceptors,
      headers: headers,
      dioBuilder: (dio) {
        return dio
          ..options.baseUrl = uri
              // .replace(
              //   path: '/$localeCode/api/v3',
              // )
              .toString();
      },
    );
  }

  OneGateway._({
    required super.envType,
    required super.uri,
    super.dioBuilder,
    super.interceptors,
    super.overrideBadCert,
    super.headers,
  });
}
