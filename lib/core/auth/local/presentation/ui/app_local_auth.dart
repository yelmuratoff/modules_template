import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../di/di.dart';
import '../../../../../shared/utils/app_global_keys.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../domain/entity/local_auth_entity.dart';
import '../../domain/value_objects/local_auth_dto.dart';
import 'screen_local_auth/screen_local_auth.dart';
import '../controller/local_auth_controller.dart';

class AppLocalAuth extends StatefulWidget {
  const AppLocalAuth._(this.cubit);

  final LocalAuthController cubit;

  static OverlayEntry? _currentLoader;
  static OverlayState? _overlayState;

  @override
  State<AppLocalAuth> createState() => _AppLocalAuthState();

  static Future<bool> setup(LocalAuthDto dto) => _execute(
        (vm) => vm?.setup(dto),
      );

  static Future<bool> verification(LocalAuthDto dto) => _execute(
        (vm) => vm?.verification(dto),
      );

  static Future<bool> _execute(
    void Function(LocalAuthController?) action,
  ) async {
    final vm = _showOverlay();
    return _handleEvent(() => action(vm), vm?.stream);
  }

  static LocalAuthController? _showOverlay() {
    AppGlobalKeys.scaffoldMessenger.currentContext?.loaderOverlay.hide();
    _overlayState = AppGlobalKeys.navigator.currentState?.overlay;
    final cubit = LocalAuthController(
      entity: appDi.core.get<LocalAuthEntity>(),
      onComplete: _hideOverlay,
      defaultErrorMessage: L10n.current.somethingWentWrong,
    );
    _currentLoader = OverlayEntry(
      builder: (context) {
        return AppLocalAuth._(cubit);
      },
    );
    _overlayState?.insert(_currentLoader!);
    return cubit;
  }

  static void _hideOverlay() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (_currentLoader != null) {
          try {
            _currentLoader?.remove();
          } catch (_) {
          } finally {
            _currentLoader = null;
          }
        }
      },
    );
  }

  static Future<bool> _handleEvent(
    VoidCallback event,
    Stream<LocalAuthVmState>? stream,
  ) {
    if (stream == null) return Future.value(false);
    final completer = Completer<bool>();
    late StreamSubscription subsc;
    subsc = stream.listen(
      (state) {
        if (state is LocalAuthVmVerified) {
          subsc.cancel();
          completer.complete(true);
        } else if (state is LocalAuthVmUnverified) {
          subsc.cancel();
          completer.complete(false);
        }
      },
    );
    event();
    return completer.future;
  }
}

class _AppLocalAuthState extends State<AppLocalAuth> {
  @override
  void dispose() {
    widget.cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScreenLocalAuth(cubit: widget.cubit),
    );
  }
}
