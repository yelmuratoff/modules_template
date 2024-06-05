import 'dart:async';

import '../../../../../core/_shared/interface/i_disposable.dart';
import 'user_entity.dart';

class UserInteractor implements IDisposable {
  UserInteractor({
    required this.entity,
    this.onDelete,
  }) {
    init();
  }

  final void Function(UserDeleted state)? onDelete;
  final UserEntity entity;

  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
  }

  void init() {
    _subscription = entity.stream.listen(
      (state) {
        if (state is UserDeleted) {
          onDelete?.call(state);
        }
      },
    );
  }
}
