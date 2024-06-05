import 'package:flutter/foundation.dart';

@immutable
class LocalAuthException implements Exception {
  const LocalAuthException(this.message);

  final String message;

  @override
  bool operator ==(covariant LocalAuthException other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'LocalAuthException(message: $message)';
}
