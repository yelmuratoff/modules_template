import '../../../../../environment.dart';
import '../interface/backend_base.dart';
import '../../../gateway/domain/entity/core_gateway.dart';
import 'interceptors/auth_interceptor.dart';

class CoreBackend extends BackendBase {
  CoreBackend({
    required super.initialEnvType,
    required super.initialLocale,
    required super.initialAuthVo,
  });

  @override
  BaseGateway updateGateways(EnvType envType) {
    return switch (envType) {
      EnvType.prod => CoreGateway(
          envType: EnvType.prod,
          // localeCode: localeCode,
          uri: Environment.coreUri(envType),
          headers: {
            'content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
          },
          interceptors: [
            AuthInterceptor(authVo: () => authVo),
          ],
        ),
      EnvType.dev => CoreGateway(
          envType: EnvType.dev,
          // localeCode: localeCode,
          uri: Environment.coreUri(envType),
          headers: {
            'content-type': 'application/json; charset=utf-8',
            'Accept': 'application/json',
          },
          interceptors: [
            AuthInterceptor(authVo: () => authVo),
          ],
        ),
    };
  }
}