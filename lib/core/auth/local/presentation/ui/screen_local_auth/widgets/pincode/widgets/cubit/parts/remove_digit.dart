part of '../cubit_view_pincode.dart';

extension RemoveDigit on CubitViewPinCode {
  void _removeDigit(
    ValueChanged<StateCubitViewPinCode> emit,
  ) {
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
      StateCubitViewPinCode(pin: newPin),
    );
  }
}
