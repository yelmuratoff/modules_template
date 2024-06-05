import 'package:equatable/equatable.dart';

import '../../../../../../_shared/value_objects/auth_vo.dart';

sealed class ChangePasswordState {}

class ChangePasswordIdle extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState with EquatableMixin {
  ChangePasswordSuccess(this.vo);

  final AuthVo vo;

  @override
  List<Object> get props => [vo];
}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordError extends ChangePasswordState with EquatableMixin {
  ChangePasswordError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
