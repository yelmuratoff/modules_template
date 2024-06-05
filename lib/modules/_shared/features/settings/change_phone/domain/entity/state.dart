import 'package:equatable/equatable.dart';

import '../value_objects/response.dart';

abstract class ChangeState {}

class ChangeIdle extends ChangeState {}

class ChangeLoading extends ChangeState {}

class ChangeCode extends ChangeState with EquatableMixin {
  ChangeCode({required this.resp});

  final Response resp;

  @override
  List<Object> get props => [resp];
}

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
