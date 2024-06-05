sealed class EventSignIn {}

class DoSignUp extends EventSignIn {
  DoSignUp(this.email, this.password);

  final String email;
  final String password;
}

class RetrySignUp extends EventSignIn {
  RetrySignUp({required this.email});

  final String email;
}

class ConfirmSignUp extends EventSignIn {
  ConfirmSignUp({
    required this.uid,
    required this.code,
  });

  final int code;
  final int uid;
}
