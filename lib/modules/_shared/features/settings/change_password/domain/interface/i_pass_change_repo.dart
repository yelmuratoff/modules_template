abstract class IPassChangeRepo {
  Future<void> changePassword(
    String currentPassword,
    String password,
  );
}
