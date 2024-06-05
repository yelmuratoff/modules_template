import '../../../../../../../shared/value_objects/auth_vo.dart';

export '../../../../../../../shared/value_objects/auth_vo.dart';

abstract class IChangePasswordRepo {
  Future<AuthVo> changePassword(
    int uid,
    int code,
    String password,
  );
}
