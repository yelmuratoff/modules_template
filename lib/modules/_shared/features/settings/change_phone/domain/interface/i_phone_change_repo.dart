import '../value_objects/response.dart';

abstract class IPhoneChangeRepo {
  Future<Response> request(String phone);

  Future<String> confirm(String phone, String code);
}
