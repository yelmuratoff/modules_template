import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../_shared/value_objects/auth_vo.dart';
import '../../../../../network/gateway/domain/interface/i_gateway.dart';
import '../../../_shared/domain/value_objects/auth_response.dart';
import '../domain/interface/i_email_sign_up_repo.dart';

class EmailSignUpRepo implements IEmailSignUpRepo {
  EmailSignUpRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthVo> confirm(int uid, int code) async {
    final response = await gateway.dio.post(
      '/user/register/email-confirm',
      data: {
        'uid': uid,
        'code': code,
      },
    );
    final error = AuthException.fromMap(response.data);
    if (error.isNotEmpty) throw error;
    try {
      return AuthVo.fromJson(response.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }

  @override
  Future<AuthResponse> signUp(String email, String password) async {
    final response = await gateway.dio.post(
      '/user/register/email',
      data: {
        'email': email,
        'password': password,
        'password_confirmation': password,
      },
    );
    final error = AuthException.fromMap(response.data);
    if (error.isNotEmpty) throw error;
    try {
      return AuthResponse.fromJson(response.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }

  @override
  Future<AuthResponse> signUpRetry(String email) async {
    final response = await gateway.dio.post(
      '/user/register/email/resend',
      data: {'email': email},
    );
    final error = AuthException.fromMap(response.data);
    if (error.isNotEmpty) throw error;
    try {
      return AuthResponse.fromJson(response.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
