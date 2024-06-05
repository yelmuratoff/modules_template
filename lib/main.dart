import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ispect/ispect.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'core/env/env.dart';
import 'core/l10n/domain/value_objects/app_locale.dart';
import 'core/di/module/switcher/domain/value_objects/app_module.dart';
import 'core/env/domain/value_objects/env_type.dart';
import 'core/env/environment.dart';

Future<void> main() async {
  Environment.setup(
    envType: EnvType.dev,
    locale: AppLocale.ru,
    module: AppModule.one,
    coreUri: (envType) {
      return switch (envType) {
        EnvType.prod => Uri.parse(Env.prodUrl),
        EnvType.dev => Uri.parse(Env.devUrl),
      };
    },
    moduleUri: (module, envType) {
      return switch (module) {
        AppModule.one => switch (envType) {
            EnvType.prod => Uri.parse(Env.oneProdUrl),
            EnvType.dev => Uri.parse(Env.oneDevUrl),
          },
        AppModule.two => switch (envType) {
            EnvType.prod => Uri.parse(Env.twoProdUrl),
            EnvType.dev => Uri.parse(Env.twoDevUrl),
          },
      };
    },
  );
  runZonedGuarded<Future<void>>(
    () async {
      await bootstrap();
      return runApp(const App());
    },
    // ignore: unnecessary_lambdas
    (error, stack) {
      talkerWrapper.handle(
        exception: error,
        stackTrace: stack,
        message: 'runZonedGuarded',
      );
      // if (kReleaseMode && AppDefaults.envType == EnvType.prod) {
      //   FirebaseCrashlytics.instance
      //       .recordError(
      //         error,
      //         stack,
      //         reason: 'runZonedGuarded',
      //       )
      //       .whenComplete(
      //         () => FirebaseCrashlytics.instance.sendUnsentReports(),
      //       );
      // }
    },
  );
}
