import '../../../../../../_shared/value_objects/auth_vo.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';

abstract class IEmailSignUpRepo {
  Future<AuthResponse> signUp(String email, String password);

  Future<AuthVo> confirm(int uid, int code);

  Future<AuthResponse> signUpRetry(String email);
}
