abstract class EventChange {}

class RequestChange extends EventChange {
  RequestChange(this.email);

  final String email;
}

class ConfirmChange extends EventChange {
  ConfirmChange({
    required this.code,
    required this.email,
  });

  final String code;
  final String email;
}
