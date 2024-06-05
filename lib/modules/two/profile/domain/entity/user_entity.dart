import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/_shared/utils/throw_if_needed.dart';
import '../interface/i_user_repo.dart';
import 'state.dart';

export 'state.dart';

class UserEntity extends Cubit<UserState> {
  UserEntity({required this.remote}) : super(UserIdle());

  final IUserRepo remote;

  Future<void> delete() async {
    emit(UserLoading());
    try {
      final message = await remote.delete();
      emit(
        UserDeleted(message: message),
      );
    } catch (error, stack) {
      emit(
        UserError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  Future<void> read() async {
    emit(UserLoading());
    try {
      final user = await remote.read();
      emit(UserData(user));
    } catch (error, stack) {
      if (isClosed) return;
      emit(
        UserError(error),
      );
      throwIfNeeded(error, stack);
    }
  }

  void update(User? user) {
    if (user == null) {
      emit(UserIdle());
    } else {
      emit(UserData(user));
    }
  }
}
