import 'package:equatable/equatable.dart';

abstract class ChangeState {}

class ChangeIdle extends ChangeState {}

class ChangeLoading extends ChangeState {}

class ChangeSuccess extends ChangeState with EquatableMixin {
  ChangeSuccess({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ChangeError extends ChangeState with EquatableMixin {
  ChangeError(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}
