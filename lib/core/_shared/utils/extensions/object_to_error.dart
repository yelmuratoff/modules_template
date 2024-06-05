import 'package:dio/dio.dart';

import '../../../l10n/generated/l10n.dart';
import '../../exceptions/app_exception.dart';

extension ObjectToErrorX on Object {
  String toErrorMessage() => toErrorMessages().first;

  Set<String> toErrorMessages() {
    if (this is AppException) {
      switch (this as AppException) {
        case BackendException(messages: final messages):
          if (messages.isNotEmpty) {
            return messages;
          }
          return {S.current.somethingWentWrong};

        case AuthException(errors: final Map errors):
          final output = errors.values.expand(
            (item) {
              if (item is Iterable) {
                return item.map((e) => e.toString()).toSet();
              } else {
                return {item.toString()};
              }
            },
          ).toSet();
          if (output.isEmpty) {
            output.add(S.current.somethingWentWrong);
          }
          return output;
        case AuthException(message: final String? message):
          return {message ?? S.current.somethingWentWrong};

        case final ConvertException _:
          return {S.current.error710};
        case final InfoException exception:
          return {exception.message ?? S.current.somethingWentWrong};
        case final FbTokenException exception:
          return switch (exception.switchOn) {
            true => {S.current.pushNotifsErrorCantSwitchOn},
            false => {S.current.pushNotifsErrorCantSwitchOff},
          };
        case final StorageReadException _:
          return {S.current.error711};
        case final StorageWriteException _:
          return {S.current.error712};
      }
    } else {
      if (this is DioException) {
        final error = this as DioException;
        final response = error.response;
        final e = BackendException.fromJson(response?.data);
        if (e.messages.isNotEmpty) return e.messages.toSet();
        switch (error.type) {
          case DioExceptionType.connectionError:
            return {S.current.error399};
          case DioExceptionType.sendTimeout:
            return {S.current.error408};
          case DioExceptionType.receiveTimeout:
            return {S.current.error504};
          default:
            switch (response?.statusCode) {
              case 400:
                var output = response?.data['message'];
                output ??= S.current.somethingWentWrong;
                return {output};
              case 401:
                return {S.current.error401};
              case 403:
                return {S.current.error403};
              case 404:
                return {S.current.error404};
              case 500:
                return {S.current.error500};
              default:
                if (error.message != null) return {error.message!};
            }
        }
      }
      return {S.current.somethingWentWrong};
    }
  }
}
