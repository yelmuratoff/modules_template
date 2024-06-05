import '../../../../../_shared/domain/value_objects/auth_response.dart';

abstract class IPhoneRecoveryRepo {
  Future<AuthResponse> recover(String phone);
}
