import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/utils/throw_if_needed.dart';
import '../interface/i_email_recovery_repo.dart';
import 'event.dart';
import 'state.dart';

export 'event.dart';
export 'state.dart';

class EmailRecoveryEntity extends Bloc<EventRecovery, RecoveryState> {
  EmailRecoveryEntity({
    required this.remote,
    required this.timeOut,
  }) : super(RecoveryIdle()) {
    on<DoRecovery>(_recover);
  }

  final IEmailRecoveryRepo remote;
  final Duration timeOut;

  Future<void> _recover(
    DoRecovery event,
    Emitter<RecoveryState> emit,
  ) async {
    emit(RecoveryLoading());
    try {
      final resp = await remote.recover(event.email);
      emit(
        RecoveryUnauthorized(
          resp: resp.copyWith(
            timeout: DateTime.now().add(timeOut),
          ),
        ),
      );
    } catch (error, stack) {
      emit(RecoveryError(error));
      throwIfNeeded(error, stack);
    }
  }
}
