import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_phone_sign_up_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class PhoneSignUpEntity extends Bloc<EventSignUp, SignUpState> {
  PhoneSignUpEntity({
    required this.remote,
    this.timeOut = const Duration(seconds: 59),
  }) : super(SignUpIdle()) {
    on<DoSignUp>(_signUp);
    on<ConfirmSignUp>(_confirm);
    on<RetrySignUp>(_retry);
  }

  final IPhoneSignUpRepo remote;
  final Duration timeOut;

  Future<void> _signUp(
    DoSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      final resp = await remote.signUp(
        event.phone,
        event.password,
      );
      emit(
        SignUpUnauthorized(
          resp: resp.copyWith(
            timeout: DateTime.now().add(timeOut),
          ),
        ),
      );
    } catch (error, stack) {
      emit(
        SignUpError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> _confirm(
    ConfirmSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      final response = await remote.confirm(
        event.uid,
        event.code,
      );
      emit(
        SignUpAuthorized(response),
      );
    } catch (error, stack) {
      emit(
        SignUpError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> _retry(
    RetrySignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      final resp = await remote.signUpRetry(
        event.phone,
      );
      emit(
        SignUpUnauthorized(
          resp: resp.copyWith(
            timeout: DateTime.now().add(timeOut),
          ),
        ),
      );
    } catch (error, stack) {
      emit(
        SignUpError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
