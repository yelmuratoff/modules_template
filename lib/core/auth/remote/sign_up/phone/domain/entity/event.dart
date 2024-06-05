sealed class EventSignUp {}

class DoSignUp extends EventSignUp {
  DoSignUp(this.phone, this.password);

  final String phone;
  final String password;
}

class RetrySignUp extends EventSignUp {
  RetrySignUp({required this.phone});

  final String phone;
}

class ConfirmSignUp extends EventSignUp {
  ConfirmSignUp({
    required this.uid,
    required this.code,
  });

  final int code;
  final int uid;
}
