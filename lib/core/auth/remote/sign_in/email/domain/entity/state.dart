import 'package:equatable/equatable.dart';

import '../../../../../../_shared/value_objects/auth_vo.dart';

sealed class SignInState {}

class SignInIdle extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState with EquatableMixin {
  SignInSuccess(this.vo);

  final AuthVo vo;

  @override
  List<Object> get props => [vo];
}

class SignInError extends SignInState with EquatableMixin {
  SignInError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
