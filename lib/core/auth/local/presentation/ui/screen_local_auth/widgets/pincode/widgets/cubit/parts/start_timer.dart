part of '../cubit_view_pincode.dart';

extension StartTimer on CubitViewPinCode {
  void _startTimer(
    Duration timeOut,
    ValueChanged<StateCubitViewPinCode> emit,
  ) {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timer.tick >= timeOut.inSeconds) {
          timer.cancel();
          _attempts = 0;
          remainingSeconds = null;
          emit(
            const StateCubitViewPinCode(),
          );
        } else {
          remainingSeconds = timeOut.inSeconds - timer.tick;
          emit(
            StateCubitViewPinCode(
              pin: {
                0: null,
                1: null,
                2: null,
                3: null,
              },
              errorMessage: timeoutErrorMessage(
                remainingSeconds.toString(),
              ),
            ),
          );
        }
      },
    );
  }
}
