import 'package:dio/dio.dart';
import 'package:ispect/ispect.dart';

import '../exceptions/app_exception.dart';

void throwIfNeeded(Object error, StackTrace stackTrace) {
  switch (error) {
    case final BackendException _:
    case final AuthException _:
      talkerWrapper.handle(exception: error, stackTrace: stackTrace);
      break;

    case final DioException error:
      switch (error.response?.statusCode) {
        case 401:
          break;
        case 403:
          break;
        default:
          throw error;
      }

    default:
      Error.throwWithStackTrace(error, stackTrace);
  }
}
