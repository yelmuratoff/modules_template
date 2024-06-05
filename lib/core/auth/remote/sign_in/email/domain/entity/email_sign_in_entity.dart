import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/utils/throw_if_needed.dart';
import '../interface/i_email_sign_in_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class EmailSignInEntity extends Bloc<EventSignIn, SignInState> {
  EmailSignInEntity({required this.remote}) : super(SignInIdle()) {
    on<DoSignIn>(_signIn);
  }

  final IEmailSignInRepo remote;

  Future<void> _signIn(
    DoSignIn event,
    Emitter<SignInState> emit,
  ) async {
    emit(SignInLoading());
    try {
      final response = await remote.signIn(
        event.email,
        event.password,
      );
      emit(
        SignInSuccess(response),
      );
    } catch (error, stack) {
      emit(
        SignInError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
