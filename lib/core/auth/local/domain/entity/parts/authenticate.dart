part of '../local_auth_entity.dart';

mixin Authenticate {
  Future<bool> _authenticate(LocalAuthentication localAuth) async {
    try {
      return await localAuth.authenticate(
        localizedReason: S.current.localAuthLocalizedReason,
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: S.current.localAuthSignInTitle,
            biometricHint: '',
            cancelButton: S.current.noThanks,
          ),
          IOSAuthMessages(
            cancelButton: S.current.noThanks,
          ),
        ],
      );
    } on PlatformException catch (error) {
      var errorMessage = S.current.somethingWentWrong;

      //Защита паролем не установлена в настройках вашего устройстве
      if (error.code == error_codes.notEnrolled) {
        errorMessage = S.current.localAuthNotEnrolled;

        //Слишком много попыток, попробуйте позже
      } else if (error.code == error_codes.lockedOut) {
        errorMessage = S.current.localAuthTooManyAttempts;

        //Биометрия недоступна, попробуйте позже
      } else if (error.code == error_codes.notAvailable) {
        errorMessage = S.current.localAuthUnavailable;

        //The device operating system is unsupported
      } else if (error.code == error_codes.otherOperatingSystem) {
        errorMessage = 'The device operating system is unsupported';

        //Пожалуйста, установите пароль в настройках вашего устройства
      } else if (error.code == error_codes.passcodeNotSet) {
        errorMessage = S.current.localAuthPassCodeNotSet;

        //Слишком много попыток, требуется разблокировка
      } else if (error.code == error_codes.permanentlyLockedOut) {
        errorMessage = S.current.localAuthPermanentlyLocked;
      }

      throw LocalAuthException(errorMessage);
    }
  }
}
