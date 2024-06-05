sealed class EventRecovery {}

class DoRecovery extends EventRecovery {
  DoRecovery(this.phone);

  final String phone;
}
