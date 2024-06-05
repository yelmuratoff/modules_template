import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/_shared/utils/throw_if_needed.dart';
import '../interface/i_email_change_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class EmailChangeEntity extends Bloc<EventChange, ChangeState> {
  EmailChangeEntity({
    required this.remote,
  }) : super(ChangeIdle()) {
    on<RequestChange>(_request);
    on<ConfirmChange>(_confirm);
  }

  final IEmailChangeRepo remote;

  //confirm code and save new email
  Future<void> _confirm(
    ConfirmChange event,
    Emitter<ChangeState> emit,
  ) async {
    try {
      emit(ChangeLoading());
      await remote.confirm(
        event.email,
        event.code,
      );
      emit(
        ChangeSuccess(),
      );
    } catch (error, stack) {
      emit(
        ChangeError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  //Request for code to selected email
  Future<void> _request(
    RequestChange event,
    Emitter<ChangeState> emit,
  ) async {
    emit(ChangeLoading());
    try {
      final response = await remote.request(event.email);
      emit(
        ChangeCode(
          resp: response.copyWith(
            timeout: DateTime.now().add(
              const Duration(seconds: 59),
            ),
          ),
        ),
      );
    } catch (error, stack) {
      emit(
        ChangeError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
