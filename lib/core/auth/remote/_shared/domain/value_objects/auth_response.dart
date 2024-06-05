import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable {
  const AuthResponse({
    required this.code,
    this.uid = 0,
    this.message,
    this.timeout,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      uid: json['uid'] ?? 0,
      code: json['code'].toString(),
      message: json['message'].toString(),
    );
  }

  final String code;
  final String? message;
  final DateTime? timeout;
  final int uid;

  @override
  List<Object?> get props => [uid, code, timeout, message];

  AuthResponse copyWith({
    String? code,
    DateTime? timeout,
    int? uid,
    String? message,
  }) {
    return AuthResponse(
      code: code ?? this.code,
      timeout: timeout ?? this.timeout,
      uid: uid ?? this.uid,
      message: message ?? this.message,
    );
  }
}
