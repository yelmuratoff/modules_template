import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

export 'extensions.dart';

@immutable
class LocalAuthState extends Equatable {
  const LocalAuthState({
    this.isBiometricsOn,
    this.pin,
    this.isInitCompleted = false,
    this.isAuthorized = false,
  });

  final bool? isBiometricsOn;
  final bool isInitCompleted;
  final String? pin;
  final bool isAuthorized;

  @override
  String toString() => 'LocalAuthState('
      'isAuthorized: $isAuthorized, '
      'isBiometricsOn: $isBiometricsOn, '
      'isInitCompleted: $isInitCompleted, '
      'pin: $pin'
      ')';

  LocalAuthState copyWith({
    bool? isBiometricsOn,
    bool? isInitCompleted,
    String? pin,
    bool? isAuthorized,
  }) {
    return LocalAuthState(
      isBiometricsOn: isBiometricsOn ?? this.isBiometricsOn,
      isInitCompleted: isInitCompleted ?? this.isInitCompleted,
      pin: pin ?? this.pin,
      isAuthorized: isAuthorized ?? this.isAuthorized,
    );
  }

  @override
  List<Object?> get props =>
      [isBiometricsOn, isInitCompleted, pin, isAuthorized];
}
