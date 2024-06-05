// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import '../../../../../shared/value_objects/auth_vo.dart';
import '../../../../l10n/domain/value_objects/app_locale.dart';
import '../../../gateway/domain/interface/i_gateway.dart';

export '../../../../../shared/value_objects/auth_vo.dart';
export '../../../../env/domain/value_objects/env_type.dart';
export '../../../gateway/domain/interface/base_gateway.dart';

abstract class BackendBase {
  BackendBase({
    required EnvType initialEnvType,
    required AppLocale initialLocale,
    required AuthVo? initialAuthVo,
  })  : _localeCode = initialLocale.code,
        _envType = initialEnvType,
        _authVo = initialAuthVo {
    _gateway = updateGateways(_envType);
  }

  EnvType _envType;
  final _errorsController = StreamController<Object>.broadcast();
  late IGateway _gateway;
  String _localeCode;
  AuthVo? _authVo;

  AuthVo? get authVo => _authVo;

  Stream<Object> get errors => _errorsController.stream;

  void emitError(Object error) => _errorsController.add(error);

  String get localeCode => _localeCode;

  ///Override with empty method to switch off
  ///any reaction on environment type changes
  void updateEnvType(EnvType? value) {
    if (value == null) return;
    _envType = value;
    _gateway = updateGateways(_envType);
  }

  ///Override with empty method to switch off
  ///any reaction on locale code changes
  void updateLocaleCode(String? value) {
    if (value == null) return;
    _localeCode = value;
    _gateway = updateGateways(_envType);
  }

  ///Override with empty method to switch off
  ///any reaction on token changes
  void updateAuthVo(AuthVo? value) {
    _authVo = value;
  }

  IGateway get gateway => _gateway;

  ///Setup gateways depending on the environment type
  IGateway updateGateways(EnvType envType);

  Future<void> dispose() {
    return _errorsController.close();
  }
}
