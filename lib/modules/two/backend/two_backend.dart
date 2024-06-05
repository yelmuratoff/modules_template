import 'package:ispect/ispect.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../../../bootstrap.dart';
import '../../../core/api/backend/domain/entity/interceptors/auth_interceptor.dart';
import '../../../core/api/backend/domain/entity/interceptors/error_interceptor.dart';
import '../../../core/api/backend/domain/interface/backend_base.dart';
import '../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../core/env/environment.dart';
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
            TalkerDioLogger(
              talker: talker,
              settings: TalkerDioLoggerSettings(
                printRequestHeaders: true,
                printResponseHeaders: true,
                errorPen: AnsiPen()..red(bold: true),
              ),
            ),
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
            TalkerDioLogger(
              talker: talker,
              settings: TalkerDioLoggerSettings(
                printRequestHeaders: true,
                printResponseHeaders: true,
                errorPen: AnsiPen()..red(bold: true),
              ),
            ),
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
