import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../core/di/di.dart';
import '../app_bar/app_sliver_bar.dart';

void showUserAgreement(BuildContext context) {
  showGeneralDialog(
    context: context,
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      final localeCode = appDi.core.get<LocaleEntity>().state.locale.code;
      return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const AppSliverBar(),
          SliverFillRemaining(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(20),
              color: context.color.background,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(
                    'https://policies.google.com/terms?hl=$localeCode',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
