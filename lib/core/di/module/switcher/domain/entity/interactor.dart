import 'dart:async';

import '../../../../../../shared/interface/i_disposable.dart';
import 'module_entity.dart';

class ModuleInteractor implements IDisposable {
  ModuleInteractor({
    required this.entity,
    this.onChange,
  }) {
    init();
  }

  final void Function(AppModule module)? onChange;
  final ModuleEntity entity;

  AppModule? _prev;
  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async => _subscription?.cancel();

  void init() {
    _subscription = entity.stream.listen(_handle);
  }

  void _handle(state) {
    if (_prev != state.module) {
      onChange?.call(state.module);
      _prev = state.module;
    }
  }
}
