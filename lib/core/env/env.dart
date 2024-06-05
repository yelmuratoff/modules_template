// lib/env/env.dart
import 'package:envied/envied.dart';
part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'PROD_URL', useConstantCase: true)
  static const String prodUrl = _Env.prodUrl;

  @EnviedField(varName: 'DEV_URL', useConstantCase: true)
  static const String devUrl = _Env.devUrl;

  @EnviedField(varName: 'ONE_PROD_URL', useConstantCase: true)
  static const String oneProdUrl = _Env.oneProdUrl;

  @EnviedField(varName: 'ONE_DEV_URL', useConstantCase: true)
  static const String oneDevUrl = _Env.oneDevUrl;

  @EnviedField(varName: 'TWO_PROD_URL', useConstantCase: true)
  static const String twoProdUrl = _Env.twoProdUrl;

  @EnviedField(varName: 'TWO_DEV_URL', useConstantCase: true)
  static const String twoDevUrl = _Env.twoDevUrl;
}
