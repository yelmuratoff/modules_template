import '../../../../api/gateway/domain/interface/i_gateway.dart';
import '../domain/interface/i_sign_out_repo.dart';

class SignOutRepo implements ISignOutRepo {
  SignOutRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<void> signOut() async {
    await gateway.dio.get('/user/logout');
  }
}
