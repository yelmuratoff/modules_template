import 'package:equatable/equatable.dart';

class Response extends Equatable {
  const Response({
    required this.code,
    required this.email,
    this.message,
    this.timeout,
  });

  final int code;
  final String email;
  final String? message;
  final DateTime? timeout;

  @override
  List<Object?> get props => [message, code, email, timeout];

  Response copyWith({
    String? message,
    int? code,
    String? email,
    DateTime? timeout,
  }) {
    return Response(
      message: message ?? this.message,
      code: code ?? this.code,
      email: email ?? this.email,
      timeout: timeout ?? this.timeout,
    );
  }
}
