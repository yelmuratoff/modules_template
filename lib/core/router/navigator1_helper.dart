import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../di/di.dart';
import '../../modules/one/navigation/root_screen/one_root_screen.dart';
import '../../modules/two/navigation/root_screen/two_root_screen.dart';
import '../../shared/utils/app_global_keys.dart';
import '../../shared/value_objects/auth_vo.dart';
import '../auth/remote/sign_out/presentation/sign_out_screen.dart';
import '../di/module/switcher/domain/entity/module_entity.dart';
import '../../shared/presentation/pages/splash/presentation/ui/splash_screen.dart';
import 'navigator_transitions.dart';

extension NavigatorUtils on BuildContext {
  NavigatorState get router => Navigator.of(this);
  NavigatorState get rootRouter => Navigator.of(this, rootNavigator: true);
}

extension NavigatorStateUtils on NavigatorState {
  NavigatorHelper get use => NavigatorHelper(this);
}

extension NavigatorStateUtilsNullable on NavigatorState? {
  NavigatorHelper? get use {
    if (this == null) return null;
    return NavigatorHelper(this!);
  }
}

extension on AppModule {
  Widget get rootScreen => switch (this) {
        AppModule.one => const OneRootScreen(),
        AppModule.two => const TwoRootScreen(),
      };
}

class NavigatorHelper {
  NavigatorHelper(this._nav);

  final NavigatorState _nav;

  Future<T?> push<T>(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.push<T?>(
      adaptiveRoute(screen, transition, transitionDuration),
    );
  }

  Future<T?> pushOff<T>(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushAndRemoveUntil<T>(
      adaptiveRoute(screen, transition, transitionDuration),
      (route) => false,
    );
  }

  Future<void> pushReplacement(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushReplacement(
      adaptiveRoute(screen, transition, transitionDuration),
    );
  }

  Future<T?> pushAndRemoveUntil<T>(
    Widget screen, {
    required String until,
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushAndRemoveUntil<T?>(
      adaptiveRoute(screen, transition, transitionDuration),
      (route) => route.settings.name == until,
    );
  }

  void popUntil<T>(String until) {
    return _nav.popUntil(
      (route) => route.settings.name == until || route.isFirst,
    );
  }

  Future<T?> pushRootScreen<T>({bool withAnimation = false}) async {
    final module = appDi.core.get<ModuleEntity>().state.module;

    _pushRootScreen(module.rootScreen, withAnimation: withAnimation);
    return Future.value();
  }

  Future<T?> pushSplashScreen<T>() {
    return _nav.pushAndRemoveUntil<T>(
      adaptiveRoute(
        const SplashScreen(),
        NavigatorTransitions.noTransition,
        Duration.zero,
      ),
      (route) => false,
    );
  }

  Future<T?> pushSignOutScreen<T>({AuthVo? authVo}) {
    return _nav.pushAndRemoveUntil<T>(
      adaptiveRoute(
        SignOutScreen(authVo: authVo),
        NavigatorTransitions.noTransition,
        Duration.zero,
      ),
      (route) => false,
    );
  }

  static Route<T> adaptiveRoute<T>(
    Widget screen, [
    TransitionBuilder? transition,
    Duration? transitionDuration,
  ]) {
    if (transition != null && transitionDuration != null) {
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: transitionDuration,
        transitionsBuilder: transition,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    }
    if (kIsWeb || Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    }
  }

  String? currentRouteName() {
    String? output;
    _nav.popUntil((route) {
      output = route.settings.name;
      return true;
    });
    return output;
  }

  Future<T?> _pushRootScreen<T>(Widget screen, {required bool withAnimation}) {
    return switch (withAnimation) {
      false => _nav.pushAndRemoveUntil<T>(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => screen,
            transitionDuration: Duration.zero,
            transitionsBuilder: (_, __, ___, child) => child,
            settings: RouteSettings(
              name: screen.runtimeType.toString(),
            ),
          ),
          (route) => false,
        ),
      true => _nav.pushAndRemoveUntil<T>(
          PageRouteBuilder(
            pageBuilder: (context, _, __) => screen,
            transitionsBuilder: NavigatorTransitions.scale,
            settings: RouteSettings(
              name: screen.runtimeType.toString(),
            ),
          ),
          (route) => false,
        ),
    };
  }
}

typedef TransitionBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> reverseAnimation,
  Widget child,
);

void resetRouter() {
  AppGlobalKeys.resetNavigator();
}
