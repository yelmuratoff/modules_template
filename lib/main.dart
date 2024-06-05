import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sc_logger/sc_logger.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'core/l10n/domain/value_objects/app_locale.dart';
import 'core/di/module/switcher/domain/value_objects/app_module.dart';
import 'core/env_type/domain/value_objects/env_type.dart';
import 'environment.dart';

Future<void> main() async {
  Environment.setup(
    envType: EnvType.dev,
    locale: AppLocale.ru,
    module: AppModule.one,
    coreUri: (envType) {
      return switch (envType) {
        EnvType.prod => Uri.parse('https://dummyjson.com'),
        EnvType.dev => Uri.parse('https://dummyjson.com'),
      };
    },
    moduleUri: (module, envType) {
      return switch (module) {
        AppModule.one => switch (envType) {
            EnvType.prod => Uri.parse('https://dummyjson.com'),
            EnvType.dev => Uri.parse('https://dummyjson.com'),
          },
        AppModule.two => switch (envType) {
            EnvType.prod => Uri.parse('https://dummyjson.com'),
            EnvType.dev => Uri.parse('https://dummyjson.com'),
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
      Log.error(error, stack);
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
