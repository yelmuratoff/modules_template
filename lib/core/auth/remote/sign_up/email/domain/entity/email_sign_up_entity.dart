import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_email_sign_up_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class EmailSignUpEntity extends Bloc<EventSignIn, SignUpState> {
  EmailSignUpEntity({
    required this.remote,
    this.timeOut = const Duration(seconds: 59),
  }) : super(SignUpIdle()) {
    on<DoSignUp>(_signUp);
    on<ConfirmSignUp>(_confirm);
    on<RetrySignUp>(_retry);
  }

  final IEmailSignUpRepo remote;
  final Duration timeOut;

  Future<void> _signUp(
    DoSignUp event,
    Emitter<SignUpState> emit,
  ) async {
    emit(SignUpLoading());
    try {
      final resp = await remote.signUp(
        event.email,
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
        SignUpSuccess(response),
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
        event.email,
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
