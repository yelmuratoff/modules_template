import 'package:ispect/ispect.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

import '../../../bootstrap.dart';
import '../../../core/di/module/switcher/domain/value_objects/app_module.dart';
import '../../../core/network/backend/domain/entity/interceptors/auth_interceptor.dart';
import '../../../core/network/backend/domain/entity/interceptors/error_interceptor.dart';
import '../../../core/network/backend/domain/interface/backend_base.dart';
import '../../../environment.dart';
import 'one_gateway.dart';

class OneBackend extends BackendBase {
  OneBackend({
    required super.initialEnvType,
    required super.initialLocale,
    required super.initialAuthVo,
  });

  @override
  BaseGateway updateGateways(EnvType envType) {
    return switch (envType) {
      EnvType.prod => OneGateway(
          envType: EnvType.prod,
          uri: Environment.moduleUri(AppModule.one, EnvType.prod),
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
      EnvType.dev => OneGateway(
          envType: EnvType.dev,
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
