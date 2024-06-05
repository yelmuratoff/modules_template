import '../../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../../network/gateway/domain/interface/i_gateway.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';
import '../domain/interface/i_phone_recovery_repo.dart';

class PhoneRecoveryRepo implements IPhoneRecoveryRepo {
  PhoneRecoveryRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthResponse> recover(String phone) async {
    final response = await gateway.dio.post(
      '/user/recovery/phone',
      data: {'phone': phone},
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
