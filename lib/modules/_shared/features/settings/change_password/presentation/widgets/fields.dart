part of '../change_password_screen.dart';

class _Fields {
  final currentPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: L10n.current.currentPassword,
    ),
  );

  final newPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: L10n.current.newPassword,
    ),
  );

  final confPasswordField = PasswordTextField(
    data: PasswordTextfieldData(
      hintText: L10n.current.confPassword,
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
        if (newPasswordField.data.controller.text !=
            confPasswordField.data.controller.text)
          {
            newPasswordField.data.showErrors([L10n.current.passwordsDontMatch]),
          },
      ].every((element) => element == true);
}
