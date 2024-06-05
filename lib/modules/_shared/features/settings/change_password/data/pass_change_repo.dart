import '../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../domain/interface/i_pass_change_repo.dart';

class PassChangeRepo implements IPassChangeRepo {
  PassChangeRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<void> changePassword(
    String currentPassword,
    String password,
  ) async {
    final response = await gateway.dio.put(
      '/user/settings/password',
      data: {
        'с_password': currentPassword,
        'password': password,
        'password_confirmation': password,
      },
    );

    final error = AuthException.fromMap(response.data);
    if (error.isNotEmpty) throw error;
  }
}
