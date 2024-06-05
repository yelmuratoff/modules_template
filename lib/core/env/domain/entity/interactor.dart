import 'dart:async';

import '../../../../shared/interface/i_disposable.dart';
import 'env_type_entity.dart';

class EnvTypeInteractor implements IDisposable {
  EnvTypeInteractor({
    required this.entity,
    this.onChange,
  }) {
    init();
  }

  final void Function(EnvType envType)? onChange;
  final EnvTypeEntity entity;

  EnvType? _prev;
  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async => _subscription?.cancel();

  void init() {
    _subscription = entity.stream.listen(_handle);
  }

  void _handle(EnvTypeState state) {
    if (_prev != state.envType) {
      onChange?.call(state.envType);
      _prev = state.envType;
    }
  }
}
