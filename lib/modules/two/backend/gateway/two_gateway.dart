import 'package:dio/dio.dart';

import '../../../../core/api/gateway/domain/interface/base_gateway.dart';

final class TwoGateway extends BaseGateway {
  factory TwoGateway({
    required EnvType envType,
    required Uri uri,
    // required String localeCode,
    List<Interceptor>? interceptors,
    Map<String, dynamic>? headers,

    ///Disable SSL certificate verification
    bool overrideBadCert = false,
  }) {
    return TwoGateway._(
      envType: envType,
      overrideBadCert: overrideBadCert,
      uri: uri,
      headers: headers,
      interceptors: interceptors,
    );
  }

  TwoGateway._({
    required super.envType,
    required super.uri,
    super.interceptors,
    super.overrideBadCert,
    super.headers,
  });
}
