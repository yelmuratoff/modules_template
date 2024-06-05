import 'package:dio/dio.dart';

import '../../../core/l10n/generated/l10n.dart';
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
          return {L10n.current.somethingWentWrong};

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
            output.add(L10n.current.somethingWentWrong);
          }
          return output;
        case AuthException(message: final String? message):
          return {message ?? L10n.current.somethingWentWrong};

        case final ConvertException _:
          return {L10n.current.error710};
        case final InfoException exception:
          return {exception.message ?? L10n.current.somethingWentWrong};
        case final FbTokenException exception:
          return switch (exception.switchOn) {
            true => {L10n.current.pushNotifsErrorCantSwitchOn},
            false => {L10n.current.pushNotifsErrorCantSwitchOff},
          };
        case final StorageReadException _:
          return {L10n.current.error711};
        case final StorageWriteException _:
          return {L10n.current.error712};
      }
    } else {
      if (this is DioException) {
        final error = this as DioException;
        final response = error.response;
        final e = BackendException.fromJson(response?.data);
        if (e.messages.isNotEmpty) return e.messages.toSet();
        switch (error.type) {
          case DioExceptionType.connectionError:
            return {L10n.current.error399};
          case DioExceptionType.sendTimeout:
            return {L10n.current.error408};
          case DioExceptionType.receiveTimeout:
            return {L10n.current.error504};
          default:
            switch (response?.statusCode) {
              case 400:
                var output = response?.data['message'];
                output ??= L10n.current.somethingWentWrong;
                return {output};
              case 401:
                return {L10n.current.error401};
              case 403:
                return {L10n.current.error403};
              case 404:
                return {L10n.current.error404};
              case 500:
                return {L10n.current.error500};
              default:
                if (error.message != null) return {error.message!};
            }
        }
      }
      return {L10n.current.somethingWentWrong};
    }
  }
}
