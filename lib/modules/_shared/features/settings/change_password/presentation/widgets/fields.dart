part of '../change_password_screen.dart';

class _Fields {
  final currentPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: S.current.currentPassword,
    ),
  );

  final newPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: S.current.newPassword,
    ),
  );

  final confPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: S.current.confPassword,
    ),
  );

  void dispose() {
    currentPasswordField.dispose();
    newPasswordField.dispose();
    confPasswordField.dispose();
  }

  bool get isValidated => [
        currentPasswordField.data.validate,
        newPasswordField.data.validate,
        confPasswordField.data.validate,
        if (newPasswordField.data.controller.text != confPasswordField.data.controller.text)
          {
            newPasswordField.data.showErrors([S.current.passwordsDontMatch]),
          },
      ].every((element) => element == true);
}
