import 'package:equatable/equatable.dart';

class AuthVo extends Equatable {
  const AuthVo({this.token});

  const AuthVo.empty() : token = null;

  factory AuthVo.fromJson(Map<String, dynamic> json) {
    return AuthVo(
      token: json['token'].toString(),
    );
  }

  final String? token;

  @override
  List<Object?> get props => [token];
}
