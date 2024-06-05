import '../../../../../_shared/domain/value_objects/auth_response.dart';

abstract class IEmailRecoveryRepo {
  Future<AuthResponse> recover(String email);
}
