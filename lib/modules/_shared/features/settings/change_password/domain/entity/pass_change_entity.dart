import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_pass_change_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class PassChangeEntity extends Bloc<EventChange, ChangeState> {
  PassChangeEntity({
    required this.remote,
  }) : super(ChangeIdle()) {
    on<DoChange>(_changePassword);
  }

  final IPassChangeRepo remote;

  Future<void> _changePassword(
    DoChange event,
    Emitter<ChangeState> emit,
  ) async {
    try {
      emit(ChangeLoading());
      await remote.changePassword(
        event.currentPassword,
        event.newPassword,
      );

      emit(ChangeSuccess());
    } catch (error, stack) {
      emit(
        ChangeError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
