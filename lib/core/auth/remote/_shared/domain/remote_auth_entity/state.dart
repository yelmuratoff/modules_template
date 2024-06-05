import 'package:equatable/equatable.dart';

import '../../../../../../shared/value_objects/auth_vo.dart';

sealed class RemoteAuthState {
  const RemoteAuthState();

  AuthVo? get authVo {
    if (this is! RemoteAuthSignedIn) return null;
    return (this as RemoteAuthSignedIn).authVo;
  }
}

class RemoteAuthIdle extends RemoteAuthState {}

class RemoteAuthLoading extends RemoteAuthState {}

class RemoteAuthSignedOut extends RemoteAuthState {}

class RemoteAuthSignedIn extends RemoteAuthState with EquatableMixin {
  const RemoteAuthSignedIn({
    required this.authVo,
    this.forceReload = false,
  });

  ///Used if token was replaced with another user's token
  ///to reload user data.
  ///For example, when user signs in with another account
  final bool forceReload;

  @override
  final AuthVo authVo;

  @override
  List<Object?> get props => [authVo, forceReload];
}

class RemoteAuthError extends RemoteAuthState with EquatableMixin {
  RemoteAuthError(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}
