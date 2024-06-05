import 'dart:async';

import '../../../../_shared/interface/i_disposable.dart';
import '../interface/backend_base.dart';

class BackendInteractor implements IDisposable {
  BackendInteractor({
    required this.backend,
    this.onError,
  }) {
    init();
  }

  final void Function(Object error)? onError;
  final BackendBase backend;

  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
  }

  void init() {
    _subscription = backend.errors.listen(
      (error) {
        onError?.call(error);
      },
    );
  }
}
