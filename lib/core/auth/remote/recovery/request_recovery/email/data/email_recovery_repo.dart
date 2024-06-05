import '../../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../../network/gateway/domain/interface/i_gateway.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';
import '../domain/interface/i_email_recovery_repo.dart';

class EmailRecoveryRepo implements IEmailRecoveryRepo {
  EmailRecoveryRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthResponse> recover(String email) async {
    final response = await gateway.dio.post(
      '/user/recovery/email',
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
