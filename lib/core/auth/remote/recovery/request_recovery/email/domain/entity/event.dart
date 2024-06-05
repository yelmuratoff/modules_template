sealed class EventRecovery {}

class DoRecovery extends EventRecovery {
  DoRecovery(this.email);

  final String email;
}
