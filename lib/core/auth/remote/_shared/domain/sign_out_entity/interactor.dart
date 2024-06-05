import 'dart:async';

import '../../../../../../shared/interface/i_disposable.dart';
import 'sign_out_entity.dart';

class SignOutInteractor implements IDisposable {
  SignOutInteractor({
    required this.entity,
    this.onSignOutRequest,
  }) {
    init();
  }

  final void Function()? onSignOutRequest;
  final SignOutEntity entity;

  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async {
    _subscription?.cancel();
  }

  void init() {
    _subscription = entity.stream.listen(
      (state) {
        if (state is SignOutRequested) {
          onSignOutRequest?.call();
        }
      },
    );
  }
}
