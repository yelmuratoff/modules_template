import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

void badCertOverride(Dio dio, String validHost) {
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient()
      ..badCertificateCallback = (cert, host, port) {
        return host == validHost;
      };

    return client;
  };
}
