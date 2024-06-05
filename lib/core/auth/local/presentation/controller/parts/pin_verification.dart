part of '../local_auth_controller.dart';

extension PinVerification on LocalAuthController {
  Future<void> _pinVerification(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    if (entity.state.pin == null) {
      emit(
        LocalAuthVmError(
          LocalAuthDto(
            errorMessage: defaultErrorMessage,
          ),
        ),
      );
      throw const LocalAuthException('Current pin is null');
    }
    emit(
      LocalAuthVmPinVerification(
        dto.copyWith(
          pin: entity.state.pin,
        ),
      ),
    );
  }
}
