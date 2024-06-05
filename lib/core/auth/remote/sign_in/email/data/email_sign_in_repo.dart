import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../network/gateway/domain/interface/i_gateway.dart';
import '../domain/interface/i_email_sign_in_repo.dart';

class EmailSignInRepo implements IEmailSignInRepo {
  EmailSignInRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthVo> signIn(String email, String password) async {
    final response = await gateway.dio.post(
      '/auth/login',
      data: {
        'username': email.split('@').first,
        'password': password,
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
}
