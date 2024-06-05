import 'dart:async';

abstract class IOnboardingRepo {
  Future<bool> isDismissed();

  Future<void> saveDismissed();
}
