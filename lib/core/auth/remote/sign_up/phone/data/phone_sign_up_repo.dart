import '../../../../../../shared/exceptions/app_exception.dart';
import '../../../../../api/gateway/domain/interface/i_gateway.dart';
import '../../../_shared/domain/value_objects/auth_response.dart';
import '../domain/interface/i_phone_sign_up_repo.dart';

class PhoneSignUpRepo implements IPhoneSignUpRepo {
  PhoneSignUpRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthVo> confirm(int uid, int code) async {
    final response = await gateway.dio.post(
      '/user/register/phone-confirm',
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
  Future<AuthResponse> signUp(String phone, String password) async {
    final response = await gateway.dio.post(
      '/user/register/phone',
      data: {
        'phone': phone,
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
  Future<AuthResponse> signUpRetry(String phone) async {
    final response = await gateway.dio.post(
      '/user/register/phone/resend',
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
