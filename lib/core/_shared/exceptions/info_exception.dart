part of 'app_exception.dart';

class InfoException extends AppException with EquatableMixin {
  const InfoException(
    this.message, {
    this.description,
    String? debugMessage,
  }) : super(debugMessage);

  final String? description;
  final String? message;

  @override
  List<Object?> get props => [description, message, debugMessage];
}
