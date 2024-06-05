import 'dart:async';

import '../../../../shared/interface/i_disposable.dart';
import '../value_objects/app_locale.dart';
import 'locale_entity.dart';

class LocaleInteractor implements IDisposable {
  LocaleInteractor({
    required this.entity,
    this.onLocaleChange,
  }) {
    init();
  }

  final void Function(AppLocale? locale)? onLocaleChange;
  final LocaleEntity entity;

  AppLocale? _prevLocale;
  StreamSubscription? _subscription;

  void init() {
    _subscription = entity.stream.listen(
      (state) async {
        if (_prevLocale != state.locale) {
          onLocaleChange?.call(state.locale);
          _prevLocale = state.locale;
        }
      },
    );
  }

  @override
  Future<void> dispose() async {
    return _subscription?.cancel();
  }
}
