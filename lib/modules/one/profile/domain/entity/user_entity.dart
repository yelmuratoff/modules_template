import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/_shared/utils/throw_if_needed.dart';
import '../../data/repo/user_repo.dart';
import '../value_objects/user.dart';
import 'states.dart';

export 'states.dart';

class UserEntity extends Cubit<UserState> {
  UserEntity({required this.remote}) : super(UserIdle());

  final UserRepo remote;

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
      emit(UserData(user: user));
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
      emit(UserData(user: user));
    }
  }
}
