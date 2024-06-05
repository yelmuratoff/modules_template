import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../_shared/utils/throw_if_needed.dart';
import '../interface/i_phone_recovery_repo.dart';
import 'events.dart';
import 'states.dart';

export 'events.dart';
export 'states.dart';

class PhoneRecoveryEntity extends Bloc<EventRecovery, RecoveryState> {
  PhoneRecoveryEntity({
    required this.remote,
    required this.timeOut,
  }) : super(RecoveryIdle()) {
    on<DoRecovery>(_phoneRecovery);
  }

  final IPhoneRecoveryRepo remote;
  final Duration timeOut;

  Future<void> _phoneRecovery(
    DoRecovery event,
    Emitter<RecoveryState> emit,
  ) async {
    emit(RecoveryLoading());
    try {
      final regData = await remote.recover(event.phone);
      emit(
        RecoveryUnauthorized(
          resp: regData.copyWith(
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
