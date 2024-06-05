import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../../core/router/navigator1_helper.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../core/di/di.dart';
import '../../home/presentation/home_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../quotes/list/presentation/quotes_screen.dart';
import 'controller/root_screen_controller.dart';
import 'controller/states.dart';
import 'widgets/nav_bar.dart';

class TwoRootScreen extends StatelessWidget {
  const TwoRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootScreenController>(
      create: (_) => RootScreenController(initial: 0),
      child: BlocBuilder<RootScreenController, PrimaryTabsState>(
        builder: (context, state) {
          final controller = context.read<RootScreenController>();
          final currentIndex = state.index;
          return BlocBuilder(
            bloc: appDi.core.get<LocaleEntity>(),
            builder: (context, _) {
              return ColoredBox(
                color: context.color.accent,
                child: Scaffold(
                  body: IndexedStack(
                    key: UniqueKey(),
                    index: currentIndex,
                    children: <Widget>[
                      Navigator(
                        key: controller.navigatorKeys[0],
                        onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                          const HomeScreen(),
                        ),
                      ),
                      Navigator(
                        key: controller.navigatorKeys[1],
                        onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                          const QuotesScreen(),
                        ),
                      ),
                      Navigator(
                        key: controller.navigatorKeys[2],
                        onGenerateRoute: (_) => NavigatorHelper.adaptiveRoute(
                          const ProfileScreen(),
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: NavBar(
                    current: currentIndex,
                    switchTo: controller.switchToTab,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
