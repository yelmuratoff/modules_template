import 'package:flutter/material.dart';

import '../../../../../_shared/assets.gen.dart';
import '../../../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../../../core/l10n/l10n_helper.dart';
import '../../../../../core/l10n/presentation/language_bottom_sheet.dart';
import '../../../../../core/l10n/presentation/utils/locale_name.dart';
import '../../../../../core/navigation/navigator1_helper.dart';
import '../../../../../core/theme/domain/entity/theme_entity.dart';
import '../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../core/theme/presentation/theme_sheet.dart';
import '../../../../../di.dart';
import '../features/about/screen_about_app.dart';
import '../features/settings/settings_screen.dart';
import 'profile_tile.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    this.showSettings = false,
    super.key,
  });

  final bool showSettings;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: context.color.grey300,
        ),
        borderRadius: BorderRadius.circular(16),
        color: context.color.background,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            spreadRadius: -4,
            blurRadius: 16,
            color: context.color.shadow.withOpacity(.14),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileTile(
            isFirst: true,
            title: appDi.core.get<LocaleEntity>().state.locale.localizedName,
            icon: Assets.shared.icons.language.svg(),
            onPressed: () async {
              final selected = await showLangSheet(
                context,
                appDi.core.get<LocaleEntity>().state.locale,
              );
              if (selected == null) return;
              await appDi.core.get<LocaleEntity>().apply(selected);
            },
          ),
          ProfileTile(
            isFirst: true,
            title: context.s.appTheme,
            icon: Assets.shared.icons.theme.svg(),
            onPressed: () async {
              final selected = await showThemeSheet(
                context,
                appDi.current.get<ThemeEntity>().state.id,
              );
              if (selected == null) return;
              appDi.current.get<ThemeEntity>().add(
                    ApplyTheme(selected),
                  );
            },
          ),
          if (showSettings)
            ProfileTile(
              title: context.s.settings,
              icon: Assets.shared.icons.settings.svg(),
              onPressed: () {
                context.rootRouter.use.push(
                  const SettingsScreen(),
                );
              },
            ),
          ProfileTile(
            isLast: true,
            title: context.s.aboutApp,
            icon: Assets.two.images.logo.image(),
            onPressed: () {
              context.rootRouter.use.push(
                const AboutAppScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
