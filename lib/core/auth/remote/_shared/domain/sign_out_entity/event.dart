import 'package:equatable/equatable.dart';

sealed class EventSignOut {}

class RequestSignOut extends EventSignOut {}

class EmitErrorOfSignOut extends EventSignOut with EquatableMixin {
  EmitErrorOfSignOut(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}

class EmitSuccessOfSignOut extends EventSignOut {}
