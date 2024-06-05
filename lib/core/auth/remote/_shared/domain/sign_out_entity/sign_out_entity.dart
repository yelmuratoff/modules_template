import 'package:flutter_bloc/flutter_bloc.dart';

import '../interface/i_sign_out_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class SignOutEntity extends Bloc<EventSignOut, SignOutState> {
  SignOutEntity({required this.remote}) : super(SignOutIdle()) {
    on<RequestSignOut>(_request);
    on<EmitErrorOfSignOut>(_emitError);
    on<EmitSuccessOfSignOut>(_emitSuccess);
  }

  final ISignOutRepo remote;

  Future<void> _request(
    RequestSignOut event,
    Emitter<SignOutState> emit,
  ) async {
    emit(SignOutRequested());
  }

  void _emitError(
    EmitErrorOfSignOut event,
    Emitter<SignOutState> emit,
  ) {
    emit(
      SignOutIdle(error: event.error),
    );
  }

  void _emitSuccess(
    EmitSuccessOfSignOut event,
    Emitter<SignOutState> emit,
  ) {
    emit(
      SignOutIdle(signOutSuccess: true),
    );
  }
}
