import 'package:dio/dio.dart';

import 'i_gateway.dart';
import 'utils/bad_cert_override.dart';

export '../../../../env/domain/value_objects/env_type.dart';

base class BaseGateway implements IGateway {
  BaseGateway({
    required this.envType,
    required this.uri,
    Dio Function(Dio)? dioBuilder,
    Duration connectTimeout = const Duration(minutes: 2),
    Duration receiveTimeout = const Duration(minutes: 2),
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,

    ///Disable SSL certificate verification
    bool overrideBadCert = false,
  }) {
    final output = Dio()
      ..options.baseUrl = uri.toString()
      ..options.connectTimeout = connectTimeout
      ..options.receiveTimeout = receiveTimeout
      ..options.headers = headers
      ..interceptors.addAll(interceptors ?? []);

    if (overrideBadCert) badCertOverride(output, uri.host);
    dio = dioBuilder?.call(output) ?? output;
  }

  @override
  late final Dio dio;

  @override
  final Uri uri;

  final EnvType envType;
}
