sealed class SignOutState {}

class SignOutIdle extends SignOutState {
  SignOutIdle({
    this.error,
    this.signOutSuccess,
  });

  final Object? error;
  final bool? signOutSuccess;

  bool get hasError => error != null;
}

class SignOutRequested extends SignOutState {}
