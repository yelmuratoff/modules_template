import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/widgets/app_error_widget.dart';
import '../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../di.dart';
import '../../../auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../onboarding/data/repo/onboarding_repo.dart';
import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../theme/domain/interface/i_theme.dart';
import '../controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController? controller;

  @override
  void initState() {
    controller = SplashController(
      onboardingRepo: OnboardingRepo(
        storage: appDi.core.get<ILocalStorageRepo>(),
      ),
      remoteAuth: appDi.core.get<RemoteAuthEntity>(),
      router: Navigator.of(context),
    )..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: context.theme.color.background,
        child: BlocConsumer<RemoteAuthEntity, RemoteAuthState>(
          bloc: appDi.core.get<RemoteAuthEntity>(),
          builder: (context, state) {
            if (state is RemoteAuthError) {
              return AppErrorWidget(
                error: state.error,
                onRetry: () {
                  appDi.core.get<RemoteAuthEntity>().init();
                },
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  textColor: context.color.accent,
                  size: MediaQuery.of(context).size.width * 0.4,
                ),
                const AppProgressIndicator(),
              ],
            );
          },
          listener: (context, state) {
            controller?.checkState(state);
          },
        ),
      ),
    );
  }
}
