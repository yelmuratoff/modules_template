part of '../local_auth_controller.dart';

extension BiometricsSetup on LocalAuthController {
  Future<void> _biometricsSetup(
    LocalAuthDto dto,
    void Function(LocalAuthVmState) emit,
  ) async {
    void emitError(String message) {
      emit(
        LocalAuthVmBiometricsSetup(
          dto.copyWith(
            errorMessage: message,
          ),
        ),
      );
    }

    emit(
      LocalAuthVmBiometricsSetup(
        dto.copyWith(
          modes: dto.modes.toSet()
            ..add(
              LocalAuthMode.biometrics,
            ),
        ),
      ),
    );

    if (dto.skipAsk) {
      late final bool success;
      try {
        success = await entity.authenticate();
      } on LocalAuthException catch (e) {
        emitError(e.message);
        return;
      } catch (e) {
        emitError(defaultErrorMessage);
        return;
      }
      if (success) {
        try {
          await entity.update(isBiometricsOn: true);
          entity.changeAuthStateTo(true);
        } catch (_) {
          emit(
            LocalAuthVmError(
              dto.copyWith(
                errorMessage: defaultErrorMessage,
              ),
            ),
          );
          rethrow;
        }
        final modes = dto.modes.toSet()
          ..remove(
            LocalAuthMode.biometrics,
          );
        setup(
          dto.copyWith(modes: modes),
        );
      } else {
        if (dto.canPop) {
          unverified();
          return;
        } else {
          emit(
            LocalAuthVmBiometricsSetup(
              dto.copyWith(
                errorMessage: '',
              ),
            ),
          );
        }
      }
    }
  }
}
