import '../value_objects/user.dart';

abstract class IUserRepo {
  Future<String?> delete();

  Future<User> read();
}
