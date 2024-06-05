import 'dart:async';

import '../../../../../_shared/interface/i_disposable.dart';
import '../../../../../_shared/value_objects/auth_vo.dart';
import 'remote_auth_entity.dart';

class RemoteAuthInteractor implements IDisposable {
  RemoteAuthInteractor({
    required this.entity,
    this.onSignIn,
    this.onSignOut,
    this.onUpdate,
  }) {
    init();
  }

  final void Function(AuthVo authVo)? onSignIn;
  final void Function()? onSignOut;
  final void Function(RemoteAuthSignedIn state)? onUpdate;
  final RemoteAuthEntity entity;

  AuthVo? _prev;
  StreamSubscription? _subscription;

  @override
  Future<void> dispose() async {
    _subscription?.cancel();
  }

  void init() {
    _prev = entity.state.authVo;
    _subscription = entity.stream.listen(_handle);
  }

  void _handle(state) {
    if (state is RemoteAuthSignedOut) {
      if (_prev != null) {
        onSignOut?.call();
        _prev = null;
      }
    } else if (state is RemoteAuthSignedIn) {
      if (_prev == null) {
        onSignIn?.call(state.authVo);
      } else {
        onUpdate?.call(state);
      }
      _prev = state.authVo;
    }
  }
}
