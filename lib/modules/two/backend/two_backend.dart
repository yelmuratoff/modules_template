import 'package:ispect/ispect.dart';

import '../../../core/network/backend/domain/entity/interceptors/auth_interceptor.dart';
import '../../../core/network/backend/domain/entity/interceptors/error_interceptor.dart';
import '../../../core/network/backend/domain/interface/backend_base.dart';
import '../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../environment.dart';
import 'gateway/two_gateway.dart';

class TwoBackend extends BackendBase {
  TwoBackend({
    required super.initialEnvType,
    required super.initialLocale,
    required super.initialAuthVo,
  });

  @override
  BaseGateway updateGateways(EnvType envType) {
    return switch (envType) {
      EnvType.prod => TwoGateway(
          envType: EnvType.prod,
          // localeCode: localeCode,
          uri: Environment.moduleUri(AppModule.two, EnvType.prod),
          headers: {
            'content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
          },
          interceptors: [
            AuthInterceptor(authVo: () => authVo),
            ErrorInterceptor(
              onAuthError: (error) {
                talkerWrapper.error(message: error.toString());
                emitError(error);
              },
            ),
          ],
        ),
      EnvType.dev => TwoGateway(
          envType: EnvType.dev,
          // localeCode: localeCode,
          uri: Environment.moduleUri(AppModule.one, EnvType.dev),
          headers: {
            'content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
          },
          interceptors: [
            AuthInterceptor(authVo: () => authVo),
            ErrorInterceptor(
              onAuthError: (error) {
                talkerWrapper.error(message: error.toString());
                emitError(error);
              },
            ),
          ],
        ),
    };
  }
}
