import 'package:equatable/equatable.dart';

class Response extends Equatable {
  const Response({
    required this.code,
    required this.phone,
    this.message,
    this.timeout,
  });

  final int code;
  final String? message;
  final String phone;
  final DateTime? timeout;

  @override
  List<Object?> get props => [message, code, phone, timeout];

  Response copyWith({
    String? message,
    int? code,
    String? phone,
    DateTime? timeout,
  }) {
    return Response(
      message: message ?? this.message,
      code: code ?? this.code,
      phone: phone ?? this.phone,
      timeout: timeout ?? this.timeout,
    );
  }
}
