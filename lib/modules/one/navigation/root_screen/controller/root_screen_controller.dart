import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class RootScreenController extends Cubit<PrimaryTabsState> {
  RootScreenController({required int initial})
      : super(PrimaryTabsState(initial));

  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  GlobalKey<NavigatorState> get currentNavigatorKey =>
      navigatorKeys[state.index];

  void switchToTab(
    int index, {
    bool clearStack = false,
  }) {
    if (clearStack || state.index == index) {
      navigatorKeys[index].clearStack();
    }
    try {
      emit(PrimaryTabsState(index));
    } catch (e) {
      ///fail silently in case cubit was disposed
    }
  }

  bool get canExitFromApp {
    return navigatorKeys[state.index].currentState?.canPop() ?? false;
  }

  void clearAllStacks() {
    for (final item in navigatorKeys) {
      item.clearStack();
    }
  }

  void clearCurrentStack() {
    navigatorKeys[state.index].clearStack();
  }
}

extension on GlobalKey<NavigatorState> {
  void clearStack() {
    currentState?.popUntil((route) => route.isFirst);
  }
}
