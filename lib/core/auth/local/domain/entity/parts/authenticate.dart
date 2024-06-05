part of '../local_auth_entity.dart';

mixin Authenticate {
  Future<bool> _authenticate(LocalAuthentication localAuth) async {
    try {
      return await localAuth.authenticate(
        localizedReason: L10n.current.localAuthLocalizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: L10n.current.localAuthSignInTitle,
            biometricHint: '',
            cancelButton: L10n.current.noThanks,
          ),
          IOSAuthMessages(
            cancelButton: L10n.current.noThanks,
          ),
        ],
      );
    } on PlatformException catch (error) {
      var errorMessage = L10n.current.somethingWentWrong;

      //Защита паролем не установлена в настройках вашего устройстве
      if (error.code == error_codes.notEnrolled) {
        errorMessage = L10n.current.localAuthNotEnrolled;

        //Слишком много попыток, попробуйте позже
      } else if (error.code == error_codes.lockedOut) {
        errorMessage = L10n.current.localAuthTooManyAttempts;

        //Биометрия недоступна, попробуйте позже
      } else if (error.code == error_codes.notAvailable) {
        errorMessage = L10n.current.localAuthUnavailable;

        //The device operating system is unsupported
      } else if (error.code == error_codes.otherOperatingSystem) {
        errorMessage = 'The device operating system is unsupported';

        //Пожалуйста, установите пароль в настройках вашего устройства
      } else if (error.code == error_codes.passcodeNotSet) {
        errorMessage = L10n.current.localAuthPassCodeNotSet;

        //Слишком много попыток, требуется разблокировка
      } else if (error.code == error_codes.permanentlyLockedOut) {
        errorMessage = L10n.current.localAuthPermanentlyLocked;
      }

      throw LocalAuthException(errorMessage);
    }
  }
}
