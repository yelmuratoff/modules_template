import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../shared/presentation/widgets/app_error_widget.dart';
import '../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../di/di.dart';
import '../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../shared/value_objects/auth_vo.dart';
import '../../../../di/module/switcher/domain/entity/module_entity.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../../../theme/domain/interface/i_theme.dart';
import '../../_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../_shared/domain/sign_out_entity/sign_out_entity.dart';

class SignOutScreen extends StatefulWidget {
  const SignOutScreen({super.key, this.authVo});

  ///Set this is to update the token after sign out.
  ///For example, after sign in with a different account
  final AuthVo? authVo;

  @override
  State<SignOutScreen> createState() => _SignOutScreenState();
}

class _SignOutScreenState extends State<SignOutScreen> {
  @override
  void initState() {
    context.loaderOverlay.hide();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        appDi.core.get<SignOutEntity>().add(
              RequestSignOut(),
            );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: BlocConsumer<SignOutEntity, SignOutState>(
          bloc: appDi.core.get(),
          builder: (context, state) {
            return switch (state) {
              SignOutIdle(error: final Object e) => AppErrorWidget(
                  message: L10n.current.error,
                  subMessage: e.toErrorMessage(),
                  onRetry: () {
                    appDi.core.get<SignOutEntity>().add(
                          RequestSignOut(),
                        );
                  },
                ),
              _ => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      L10n.current.exitFromAccount,
                      style: context.text.s16w700,
                    ),
                    const SizedBox(height: 40),
                    const AppProgressIndicator(),
                  ],
                ),
            };
          },
          listener: (context, state) async {
            if (state is SignOutIdle && state.signOutSuccess == true) {
              if (widget.authVo != null) {
                await appDi.core.get<RemoteAuthEntity>().updateAuthVo(
                      widget.authVo!,
                      forceReload: true,
                    );
              }
              appDi.core.get<ModuleEntity>().reload();
            }
          },
        ),
      ),
    );
  }
}
