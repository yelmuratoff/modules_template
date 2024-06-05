import 'package:dio/dio.dart';

export '../../../../env/domain/value_objects/env_type.dart';

abstract interface class IGateway {
  abstract final Dio dio;
  abstract final Uri uri;
}
