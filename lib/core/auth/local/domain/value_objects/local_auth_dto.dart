import 'package:flutter/foundation.dart';

import 'local_auth_mode.dart';

export 'local_auth_mode.dart';

@immutable
class LocalAuthDto {
  LocalAuthDto({
    this.canPop = false,
    this.errorMessage,
    this.isVisibleButtonSwitchToPinOnBiometricsError = true,
    this.modes = const {},
    this.pin,
    this.skipAsk = false,
    this.switchToPinOnBiometricsError = false,
    this.timeout,
  }) : key = UniqueKey();

  final bool canPop;
  final String? errorMessage;
  final bool isVisibleButtonSwitchToPinOnBiometricsError;
  final Key key;
  final Set<LocalAuthMode> modes;
  final String? pin;
  final bool skipAsk;
  final bool switchToPinOnBiometricsError;
  final DateTime? timeout;

  @override
  bool operator ==(covariant LocalAuthDto other) {
    if (identical(this, other)) return true;

    return other.canPop == canPop &&
        other.errorMessage == errorMessage &&
        other.isVisibleButtonSwitchToPinOnBiometricsError ==
            isVisibleButtonSwitchToPinOnBiometricsError &&
        other.key == key &&
        setEquals(other.modes, modes) &&
        other.pin == pin &&
        other.skipAsk == skipAsk &&
        other.switchToPinOnBiometricsError == switchToPinOnBiometricsError &&
        other.timeout == timeout;
  }

  @override
  int get hashCode {
    return canPop.hashCode ^
        errorMessage.hashCode ^
        isVisibleButtonSwitchToPinOnBiometricsError.hashCode ^
        key.hashCode ^
        modes.hashCode ^
        pin.hashCode ^
        skipAsk.hashCode ^
        switchToPinOnBiometricsError.hashCode ^
        timeout.hashCode;
  }

  @override
  String toString() {
    return 'LocalAuthDto(canPop: $canPop, errorMessage: $errorMessage, isVisibleButtonSwitchToPinOnBiometricsError: $isVisibleButtonSwitchToPinOnBiometricsError, key: $key, modes: $modes, pin: $pin, skipAsk: $skipAsk, switchToPinOnBiometricsError: $switchToPinOnBiometricsError, timeout: $timeout)';
  }

  LocalAuthDto copyWith({
    bool? canPop,
    String? errorMessage,
    bool? isVisibleButtonSwitchToPinOnBiometricsError,
    Set<LocalAuthMode>? modes,
    String? pin,
    bool? skipAsk,
    bool? switchToPinOnBiometricsError,
    DateTime? timeout,
  }) {
    return LocalAuthDto(
      canPop: canPop ?? this.canPop,
      errorMessage: errorMessage ?? this.errorMessage,
      isVisibleButtonSwitchToPinOnBiometricsError:
          isVisibleButtonSwitchToPinOnBiometricsError ??
              this.isVisibleButtonSwitchToPinOnBiometricsError,
      modes: modes ?? this.modes,
      pin: pin ?? this.pin,
      skipAsk: skipAsk ?? this.skipAsk,
      switchToPinOnBiometricsError:
          switchToPinOnBiometricsError ?? this.switchToPinOnBiometricsError,
      timeout: timeout ?? this.timeout,
    );
  }
}
