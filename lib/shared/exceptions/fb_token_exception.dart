part of 'app_exception.dart';

class FbTokenException extends AppException with EquatableMixin {
  const FbTokenException._(this.switchOn);

  FbTokenException.switchingOff() : this._(false);

  FbTokenException.switchingOn() : this._(true);

  final bool switchOn;

  @override
  List<Object?> get props => [switchOn, debugMessage];
}
