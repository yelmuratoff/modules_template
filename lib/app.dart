import 'package:flutter/material.dart';
import 'package:ispect/ispect.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '_shared/widgets/loader_overlay/app_progress_indicator.dart';
import 'core/_shared/app_global_keys.dart';
import 'core/di/module/switcher/presentation/app_module_switcher.dart';
import 'core/env/domain/value_objects/env_type.dart';
import 'core/l10n/data/convert/app_locale_convert.dart';
import 'core/l10n/domain/entity/locale_entity.dart';
import 'core/l10n/generated/l10n.dart';
import 'core/splash/presentation/ui/splash_screen.dart';
import 'di.dart';
import 'environment.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppModuleSwitcher(
      child: Builder(
        builder: (context) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayColor: Colors.black.withOpacity(0.45),
            overlayWidgetBuilder: (_) => const AppProgressIndicator(),
            child: ISpectScopeWrapper(
              options: ISpectOptions(
                locale: appDi.core.get<LocaleEntity>().state.locale.toLocale(),
              ),
              isISpectEnabled: Environment.envType == EnvType.dev,
              child: MaterialApp(
                key: const ValueKey('App'),
                scaffoldMessengerKey: AppGlobalKeys.scaffoldMessenger,
                debugShowCheckedModeBanner: false,
                localizationsDelegates:
                    ISpectLocalizations.localizationDelegates([
                  S.delegate,
                ]),
                locale: appDi.core.get<LocaleEntity>().state.locale.toLocale(),
                supportedLocales: S.delegate.supportedLocales,
                title: 'Modules template',
                home: const SplashScreen(),
                theme: Theme.of(context),
                navigatorKey: AppGlobalKeys.navigator,
                builder: (context, child) {
                  return ISpectBuilder(
                    navigatorKey: AppGlobalKeys.navigator,
                    child: child,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
