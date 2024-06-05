import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../_shared/utils/throw_if_needed.dart';
import '../interface/i_change_password_repo.dart';
import 'state.dart';

export 'state.dart';

class ChangePasswordEntity extends Cubit<ChangePasswordState> {
  ChangePasswordEntity({
    required this.remote,
  }) : super(ChangePasswordIdle());

  final IChangePasswordRepo remote;

  Future<void> changePassword({
    required int code,
    required String password,
    required int uid,
  }) async {
    emit(ChangePasswordLoading());
    try {
      final response = await remote.changePassword(
        uid,
        code,
        password,
      );
      emit(
        ChangePasswordSuccess(response),
      );
    } catch (error, stack) {
      emit(
        ChangePasswordError(error),
      );
      throwIfNeeded(error, stack);
    }
  }
}
