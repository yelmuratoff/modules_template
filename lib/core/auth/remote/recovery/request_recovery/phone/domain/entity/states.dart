import 'package:equatable/equatable.dart';

import '../../../../../_shared/domain/value_objects/auth_response.dart';

abstract class RecoveryState {
  DateTime? get timeout {
    if (this is! RecoveryUnauthorized) return null;
    return (this as RecoveryUnauthorized).resp?.timeout;
  }
}

class RecoveryIdle extends RecoveryState {}

class RecoveryConfirmed extends RecoveryState with EquatableMixin {
  RecoveryConfirmed({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class RecoveryLoading extends RecoveryState {}

class RecoveryUnauthorized extends RecoveryState with EquatableMixin {
  RecoveryUnauthorized({this.resp});

  final AuthResponse? resp;

  @override
  List<Object?> get props => [resp];
}

class RecoveryError extends RecoveryState with EquatableMixin {
  RecoveryError(this.error, {this.message});

  final Object error;
  final String? message;

  @override
  List<Object?> get props => [message, error];
}
