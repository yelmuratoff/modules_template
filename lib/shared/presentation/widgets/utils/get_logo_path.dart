import '../../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../assets.gen.dart';

extension GetPath on AppModule {
  ///Path to logo image for SignIn and SignUp screens
  ///Remove if not needed
  String get logoPath => switch (this) {
        AppModule.one => Assets.one.images.logo.path,
        AppModule.two => Assets.two.images.logo.path,
      };

  ///Path to icon image for notifications
  String get iconPath => switch (this) {
        AppModule.one => Assets.one.images.logo.path,
        AppModule.two => Assets.two.images.logo.path,
      };
}
