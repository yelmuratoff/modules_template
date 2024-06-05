import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/auth/local/domain/entity/local_auth_entity.dart';
import '../../core/auth/local/domain/value_objects/local_auth_dto.dart';
import '../../core/auth/local/presentation/ui/app_local_auth.dart';
import '../../core/l10n/l10n_helper.dart';
import '../../core/theme/domain/interface/i_theme.dart';
import '../../di.dart';
import 'divider.dart';
import 'settings_tile.dart';

class SettingsLocalAuthWidget extends StatelessWidget {
  const SettingsLocalAuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalAuthEntity, LocalAuthState>(
      bloc: appDi.core.get<LocalAuthEntity>(),
      builder: (context, state) {
        var isCodeOn = state.pin != null;
        final isBiometricsOn = state.isBiometricsOn ?? false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.s.security,
              style: context.text.s12w700.copyWith(
                color: context.color.accent,
              ),
            ),
            SettingsTile.switcher(
              title: context.s.useFastAccessCode,
              value: isCodeOn,
              onPressed: () async {
                if (state.pin != null) {
                  await appDi.core.get<LocalAuthEntity>().reset();
                } else {
                  await AppLocalAuth.setup(
                    LocalAuthDto(
                      canPop: true,
                      modes: const {
                        LocalAuthMode.pin,
                      },
                    ),
                  ).then((value) {
                    isCodeOn = value;
                  });
                }
              },
            ),
            if (isCodeOn) ...[
              const AppDivider(),
              SettingsTile.chevron(
                title: context.s.changeFastAccessCode,
                onPressed: () async {
                  await AppLocalAuth.setup(
                    LocalAuthDto(
                      canPop: true,
                      skipAsk: true,
                      modes: const {
                        LocalAuthMode.pin,
                      },
                    ),
                  );
                },
              ),
              const AppDivider(),
              SettingsTile.switcher(
                title: context.s.biometrics,
                value: isBiometricsOn,
                onPressed: () async {
                  if (state.isBiometricsOn ?? false) {
                    await appDi.core.get<LocalAuthEntity>().update(
                          isBiometricsOn: false,
                        );
                  } else {
                    await AppLocalAuth.setup(
                      LocalAuthDto(
                        canPop: true,
                        modes: const {
                          LocalAuthMode.biometrics,
                        },
                      ),
                    );
                  }
                },
              ),
            ],
            const AppDivider(),
          ],
        );
      },
    );
  }
}
