// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../../../../localization/generated/l10n.dart';

part 'parts/add_digit.dart';
part 'parts/remove_digit.dart';
part 'parts/start_timer.dart';

class CubitViewPinCode extends Cubit<StateCubitViewPinCode> {
  CubitViewPinCode({
    required this.timeoutErrorMessage,
    String? pin,
    this.errorMessage,
    DateTime? timeout,
    this.attemptsAllowed = 5,
    this.timeoutDuration,
  }) : super(const StateCubitViewPinCode()) {
    if (pin != null) {
      correctPin = pin.split('').map(int.tryParse).toList().asMap();
      final remainingSeconds = timeout?.remainingSeconds ?? 0;
      if (remainingSeconds > 0) {
        emit(
          StateCubitViewPinCode(
            pin: {
              0: null,
              1: null,
              2: null,
              3: null,
            },
            errorMessage: timeoutErrorMessage(remainingSeconds.toString()),
          ),
        );
        _startTimer(
          Duration(seconds: remainingSeconds),
          emit,
        );
      }
    }
  }

  final String Function(String remainingSeconds) timeoutErrorMessage;

  int attemptsAllowed;
  Map<int, int?>? correctPin;
  final String? errorMessage;
  int? remainingSeconds;
  final Duration? timeoutDuration;

  int _attempts = 0;
  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void addDigit(int value) => _addDigit(value, emit);

  void removeDigit() => _removeDigit(emit);
}

class StateCubitViewPinCode {
  const StateCubitViewPinCode({
    this.pin = const {
      0: null,
      1: null,
      2: null,
      3: null,
    },
    this.errorMessage,
  });

  final String? errorMessage;
  final Map<int, int?> pin;

  @override
  String toString() =>
      'StateCubitViewPinCode(errorMessage: $errorMessage, pin: $pin)';

  bool get isPinReady => pin.entries.every((item) => item.value != null);
}

extension on DateTime? {
  int? get remainingSeconds {
    if (this == null) return null;
    return this!.difference(DateTime.now()).inSeconds.clamp(0, 100000000);
  }
}
