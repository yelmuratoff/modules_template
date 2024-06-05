part of 'app_exception.dart';

class AuthException extends AppException with EquatableMixin {
  const AuthException([super.debugMessage])
      : errors = null,
        message = null;

  const AuthException.custom({
    this.errors,
    this.message,
  });

  final Map<String, dynamic>? errors;
  final String? message;

  @override
  List<Object?> get props => [message, errors];

  static AuthException fromMap(Map<String, dynamic> data) {
    String? message;
    Map<String, dynamic>? errors;

    if (data['errors'] is Map) {
      errors = data['errors'];
    } else if (data['errors'] is String) {
      message = data['errors'];
    }

    if (data['message'] is Map) {
      errors = data['message'];
    } else if (data['message'] is String) {
      message = data['message'];
    }

    return AuthException.custom(
      errors: errors,
      message: message,
    );
  }

  List<String>? get email => _getErrorsList(errors?['email']);

  List<String>? get phone => _getErrorsList(errors?['phone']);

  List<String>? get password => _getErrorsList(errors?['password']);

  List<String>? get cPassword =>
      _getErrorsList(errors?['password_confirmation']);

  List<String>? get code => _getErrorsList(errors?['code']);

  bool get isNotEmpty {
    final isNotEmpty = errors?.values.any((item) => item.isNotEmpty);
    return isNotEmpty ?? false;
  }
}

List<String>? _getErrorsList(dynamic data) {
  if (data == null) return null;
  if (data is List) return List.from(data);
  if (data is String) return [data];
  return [S.current.somethingWentWrong];
}
