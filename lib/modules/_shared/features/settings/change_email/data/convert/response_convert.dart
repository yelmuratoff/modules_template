import '../../domain/value_objects/response.dart';

extension ResponseConvert on Response {
  static Response fromJson(dynamic map) {
    return Response(
      message: map['message'],
      code: map['code'],
      email: map['email'],
    );
  }
}
