import 'dart:async';

import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/_shared/utils/extensions/string.dart';

class SmsVerificationVmodel extends Cubit<StateCubitViewPinCode> {
  SmsVerificationVmodel({
    required this.timeoutDuration,
    String? correctCode,
    this.errorMessage = '',
    this.maxAttempts = 5,
    this.length = 6,
    bool showInitialError = false,
  }) : super(
          StateCubitViewPinCode(
            errorMessage: showInitialError ? errorMessage : null,
          ),
        ) {
    if (correctCode != null) {
      this.correctCode =
          correctCode.split('').map(int.tryParse).toList().asMap();
    }
  }

  Map<int, int?>? correctCode;
  final String errorMessage;
  final int length;
  final int maxAttempts;
  int? remainingSeconds;
  Duration timeoutDuration;

  int _attempts = 0;
  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void replaceDigits(String value) {
    final temp = value.extractDigits?.split('');
    if (temp == null) return;
    final outputPin = <int, int?>{};
    for (var index = 0; index < length; index++) {
      if (temp.length < index + 1) {
        outputPin[index] = null;
      } else {
        outputPin[index] = int.tryParse(temp.elementAt(index));
      }
    }
    if (listEquals(
      outputPin.values.toList(),
      state.pin.values.toList(),
    )) return;
    final errorMessage = _validate(outputPin, correctCode);
    emit(
      StateCubitViewPinCode(
        pin: outputPin,
        errorMessage: errorMessage,
        isValidated: outputPin.isPinReady && errorMessage == null,
      ),
    );
    if (_attempts >= maxAttempts) {
      emit(
        StateCubitViewPinCode(
          pin: List.filled(length, null).asMap(),
          tooManyAttempts: true,
        ),
      );
      _attempts = 0;
      Future.delayed(timeoutDuration).whenComplete(() {
        emit(
          StateCubitViewPinCode(pin: outputPin),
        );
      });
    }
  }

  void deleteDigit() {
    if (_timer?.isActive ?? false) return;
    var indexFound = -1;
    state.pin.values.lastWhereIndexedOrNull(
      (index, element) {
        if (element != null) {
          indexFound = index;
          return true;
        }
        return false;
      },
    );
    if (indexFound < 0) return;
    final newPin = {...state.pin}..[indexFound] = null;
    emit(
      StateCubitViewPinCode(
        pin: newPin,
      ),
    );
  }

  String? _validate(Map<int, int?> pin, Map<int, int?>? correctCode) {
    if (correctCode == null) return null;

    String? errorMessage;
    if (pin.values.every((item) => item != null)) {
      if (const MapEquality().equals(pin, correctCode)) {
        errorMessage = null;
        _attempts = 0;
      } else {
        _attempts++;
        errorMessage = this.errorMessage;
      }
    }
    return errorMessage;
  }
}

class StateCubitViewPinCode extends Equatable {
  const StateCubitViewPinCode({
    this.pin = const {
      0: null,
      1: null,
      2: null,
      3: null,
      4: null,
      5: null,
    },
    this.errorMessage,
    this.tooManyAttempts = false,
    this.isValidated = false,
  });

  final String? errorMessage;
  final bool isValidated;
  final Map<int, int?> pin;
  final bool tooManyAttempts;

  @override
  List<Object?> get props => [pin, errorMessage, tooManyAttempts, isValidated];

  String get pinString => pin.values.join();
}

extension IsPinReady on Map {
  bool get isPinReady {
    return entries.every((item) => item.value != null);
  }
}
