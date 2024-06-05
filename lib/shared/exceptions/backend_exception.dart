part of 'app_exception.dart';

@immutable
class BackendException extends AppException {
  const BackendException(this.messages);

  BackendException.fromJson(dynamic data) : this(_findErrors(data));

  final Set<String> messages;

  @override
  String? get debugMessage =>
      messages.isNotEmpty ? messages.first : L10n.current.somethingWentWrong;

  @override
  List<Object?> get props => [messages, debugMessage];

  static Set<String> _findErrors(dynamic data) {
    return switch (data) {
      'Unauthorized' => {L10n.current.error401},
      {'errors': final Map errors} => errors.values.expand(_findErrors).toSet(),
      {'errors': final List errors} => errors.map((e) => e.toString()).toSet(),
      {'error': final error} => {error},
      _ => {},
    };
  }
}
