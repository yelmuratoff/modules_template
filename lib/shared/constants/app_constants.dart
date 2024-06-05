import 'package:flutter/foundation.dart';

/// `AppConstants` is a class that holds all the base `static` constants used in the app.
final class AppConstants {
  /// TODO: Change this to your app name
  static const String appName = 'Modules Template';

  /// TODO: Change this to your app identifier
  static String appIdentifier = defaultTargetPlatform == TargetPlatform.android
      ? 'kz.app.modules_template'
      : 'kz.app.modulesTemplate';
}
