part of '../cubit_view_pincode.dart';

extension AddDigit on CubitViewPinCode {
  void _addDigit(
    int value,
    ValueChanged<StateCubitViewPinCode> emit,
  ) {
    if (_timer?.isActive ?? false) return;
    var indexFound = -1;
    state.pin.values.firstWhereIndexedOrNull(
      (index, element) {
        if (element == null) {
          indexFound = index;
          return true;
        }
        return false;
      },
    );
    if (indexFound < 0) return;
    final newPin = {...state.pin}..[indexFound] = value;
    String? errorMessage;
    if (correctPin != null) {
      if (newPin.values.every((item) => item != null)) {
        if (const MapEquality().equals(newPin, correctPin)) {
          errorMessage = null;
          _attempts = 0;
        } else {
          _attempts++;
          errorMessage = this.errorMessage;
        }
      }
    }
    emit(
      StateCubitViewPinCode(
        pin: newPin,
        errorMessage: errorMessage,
      ),
    );
    if (_attempts >= 3) {
      if (timeoutDuration == null) return;
      _startTimer(timeoutDuration!, emit);
      emit(
        StateCubitViewPinCode(
          pin: newPin,
          errorMessage: timeoutErrorMessage(
            timeoutDuration!.inSeconds.toString(),
          ),
        ),
      );
    }
  }
}
