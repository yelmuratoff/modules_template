import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../network/gateway/domain/interface/i_gateway.dart';
import '../domain/interface/i_change_password_repo.dart';

class ChangePasswordRepo implements IChangePasswordRepo {
  ChangePasswordRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<AuthVo> changePassword(
    int uid,
    int code,
    String password,
  ) async {
    final response = await gateway.dio.put(
      '/user/recovery/confirm',
      data: {
        'uid': uid,
        'code': code,
        'password': password,
        'password_confirmation': password,
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
