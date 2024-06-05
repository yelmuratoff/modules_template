import 'package:equatable/equatable.dart';

import '../value_objects/user.dart';

sealed class UserState {
  User? get currentUser {
    if (this is UserData) {
      return (this as UserData).user;
    }
    return null;
  }
}

class UserIdle extends UserState {}

class UserDeleted extends UserState with EquatableMixin {
  UserDeleted({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class UserLoading extends UserState {}

class UserData extends UserState with EquatableMixin {
  UserData(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class UserError extends UserState with EquatableMixin {
  UserError(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}
