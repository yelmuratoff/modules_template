import 'package:equatable/equatable.dart';

import '../../../../../../_shared/value_objects/auth_vo.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';

abstract class SignUpState {
  DateTime? get timeout {
    if (this is SignUpUnauthorized) {
      return (this as SignUpUnauthorized).resp?.timeout;
    }
    return null;
  }
}

class SignUpIdle extends SignUpState {}

class SignUpConfirmed extends SignUpState with EquatableMixin {
  SignUpConfirmed({required this.onSuccess, this.message});

  final String? message;
  final void Function() onSuccess;

  @override
  List<Object?> get props => [message, onSuccess];
}

class SignUpLoading extends SignUpState {}

class SignUpUnauthorized extends SignUpState with EquatableMixin {
  SignUpUnauthorized({
    this.resp,
    this.onSuccess,
  });

  final void Function()? onSuccess;
  final AuthResponse? resp;

  @override
  List<Object?> get props => [resp, onSuccess];
}

class SignUpAuthorized extends SignUpState with EquatableMixin {
  SignUpAuthorized(this.vo);

  final AuthVo vo;

  @override
  List<Object> get props => [vo];
}

class SignUpError extends SignUpState with EquatableMixin {
  SignUpError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
