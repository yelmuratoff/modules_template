sealed class EventSignIn {}

class DoSignIn extends EventSignIn {
  DoSignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
