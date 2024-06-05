abstract class EventChange {}

class RequestChange extends EventChange {
  RequestChange(this.phone);

  final String phone;
}

class ConfirmChange extends EventChange {
  ConfirmChange({
    required this.code,
    required this.phone,
  });

  final String code;
  final String phone;
}
