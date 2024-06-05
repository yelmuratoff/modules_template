import 'package:equatable/equatable.dart';

class AuthState with EquatableMixin {
  AuthState({
    this.localIsLoading = true,
    this.remoteIsLoading = true,
    this.remote = false,
    this.local = false,
  });

  final bool local;
  final bool localIsLoading;
  final bool remote;
  final bool remoteIsLoading;

  @override
  List<Object> get props => [localIsLoading, local, remoteIsLoading, remote];

  @override
  String toString() => 'AppAuthCombinedState('
      'localIsLoading: $localIsLoading, '
      'local: $local, '
      'remoteIsLoading: $remoteIsLoading, '
      'remote: $remote)';

  AuthState copyWith({
    bool? localIsLoading,
    bool? local,
    bool? remoteIsLoading,
    bool? remote,
  }) {
    return AuthState(
      localIsLoading: localIsLoading ?? this.localIsLoading,
      local: local ?? this.local,
      remoteIsLoading: remoteIsLoading ?? this.remoteIsLoading,
      remote: remote ?? this.remote,
    );
  }
}
