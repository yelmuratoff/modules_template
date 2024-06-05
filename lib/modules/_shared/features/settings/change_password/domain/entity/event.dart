import 'package:equatable/equatable.dart';

abstract class EventChange {}

class DoChange extends EventChange with EquatableMixin {
  DoChange({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object> get props => [currentPassword, newPassword];
}
