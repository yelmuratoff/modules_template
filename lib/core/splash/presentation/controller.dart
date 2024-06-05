import 'package:flutter/widgets.dart';

import '../../auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../navigation/navigator1_helper.dart';
import '../../onboarding/domain/interface/i_onboarding_repo.dart';
import '../../onboarding/presentation/onboarding_screen.dart';

class SplashController {
  SplashController({
    required this.onboardingRepo,
    required this.remoteAuth,
    required this.router,
  });

  final IOnboardingRepo onboardingRepo;
  final RemoteAuthEntity remoteAuth;
  final NavigatorState router;
  bool wasInitialized = false;

  void init() {
    checkState(remoteAuth.state);
  }

  void checkState(RemoteAuthState state) {
    final initialized = switch (state) {
      final RemoteAuthSignedIn _ => true,
      final RemoteAuthSignedOut _ => true,
      _ => false,
    };
    if (initialized && !wasInitialized) {
      wasInitialized = true;
      //remove _onboarding wrapper if not needed,
      //like this: `_pushScreen(false);`
      _onboarding(_pushScreen);
    }
  }

  Future<void> _onboarding(
    void Function(bool withAnimation) pushScreen,
  ) async {
    final dismissed = await onboardingRepo.isDismissed();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (dismissed) {
        pushScreen(true);
      } else {
        router.use.push(
          OnboardingScreen(
            onDone: () {
              onboardingRepo.saveDismissed();
              pushScreen(false);
            },
          ),
        );
      }
    });
  }

  void _pushScreen(bool withAnimation) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      router.use.pushRootScreen(withAnimation: withAnimation);
    });

    //Uncomment this code if authentication is required for all screens.
    //And remove ability to pop on all auth screens: SignInScreen, SignUpScreen, etc.

    // final module = appDi.core.get<SettingsEntity>().state.module;
    // switch (module) {
    //   case AppModule.one:
    //     OneAuth.verify(
    //       onSuccess: () async {
    //         router.use.pushRootScreen(withAnimation: withAnimation);
    //       },
    //     );
    //     break;
    //   case AppModule.two:
    //     TwoAuth.verify(
    //       onSuccess: () async {
    //         router.use.pushRootScreen(withAnimation: withAnimation);
    //       },
    //     );
    //     break;
    // }
  }
}
