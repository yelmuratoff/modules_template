import 'package:equatable/equatable.dart';

import '../../../../../../../shared/value_objects/auth_vo.dart';
import '../../../../_shared/domain/value_objects/auth_response.dart';

abstract class SignUpState {
  DateTime? get timeout {
    if (this is! SignUpUnauthorized) return null;
    return (this as SignUpUnauthorized).resp?.timeout;
  }
}

class SignUpIdle extends SignUpState {}

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

class SignUpSuccess extends SignUpState with EquatableMixin {
  SignUpSuccess(this.vo);

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
