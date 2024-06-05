import '../../../../../../../shared/value_objects/auth_vo.dart';

export '../../../../../../../shared/value_objects/auth_vo.dart';

abstract class IEmailSignInRepo {
  Future<AuthVo> signIn(String email, String password);
}
