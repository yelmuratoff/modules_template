part of '../core_auth.dart';

Future<void> _setAction(
  Future<void> Function()? action, {
  bool localAuthSetup = false,
}) async {
  CoreAuth._action = () async {
    if (localAuthSetup) {
      await AppLocalAuth.setup(
        LocalAuthDto(
          canPop: true,
          modes: const {
            LocalAuthMode.pin,
            LocalAuthMode.biometrics,
          },
        ),
      );
    }

    AppGlobalKeys.navigator.currentState?.popUntil(
      (Route<dynamic> route) {
        final authRoutes = [
          'ChangePasswordScreen',
          'ChangePhoneScreen',
          'ChangeEmailScreen',
          'AuthRecoveryScreen',
          'SignInScreen',
          'SignUpScreen',
        ];
        final contains = authRoutes.contains(route.settings.name);
        return !contains;
      },
    );

    action?.call();
  };
}
