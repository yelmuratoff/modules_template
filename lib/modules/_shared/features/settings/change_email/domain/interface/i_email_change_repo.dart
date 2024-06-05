import '../value_objects/response.dart';

abstract class IEmailChangeRepo {
  Future<Response> request(String email);

  Future<String> confirm(String email, String code);
}
