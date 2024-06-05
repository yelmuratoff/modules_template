import 'package:flutter/material.dart';

abstract class AppGlobalKeys {
  static final scaffoldMessenger = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<NavigatorState> _rootNavigator = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigator => _rootNavigator;

  static GlobalKey<NavigatorState> resetNavigator() {
    return _rootNavigator = GlobalKey<NavigatorState>();
  }
}
