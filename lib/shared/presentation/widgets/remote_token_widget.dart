import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../core/env/domain/entity/env_type_entity.dart';
import '../../../core/l10n/generated/l10n.dart';
import '../../../core/theme/domain/interface/i_theme.dart';
import '../../../core/di/di.dart';
import 'banners/show_banner.dart';
import 'divider.dart';

class RemoteTokenWidget extends StatelessWidget {
  const RemoteTokenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvTypeEntity, EnvTypeState>(
      bloc: appDi.core.get<EnvTypeEntity>(),
      builder: (context, state) {
        if (state.isProduction) {
          return const SizedBox.shrink();
        }
        return BlocBuilder<RemoteAuthEntity, RemoteAuthState>(
          bloc: appDi.core.get(),
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Токен:',
                  style: context.text.s16w400,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        state.authVo?.token ?? L10n.current.noData,
                        style: context.text.s14w400,
                      ),
                    ),
                  ],
                ),
                if (state.authVo?.token != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: context.button.elevated1,
                            child: const Text('Поделиться'),
                            onPressed: () async {
                              ShowBanner.hide();
                              Share.share(state.authVo!.token!);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                const AppDivider(),
              ],
            );
          },
        );
      },
    );
  }
}
