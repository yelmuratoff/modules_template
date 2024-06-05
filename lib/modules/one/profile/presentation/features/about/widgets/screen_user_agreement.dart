import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../../../../_shared/widgets/app_bar/app_sliver_bar.dart';
import '../../../../../../../_shared/widgets/app_bar/leading_buttons/arrow_leading_button.dart';
import '../../../../../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../../../../../di.dart';

class UserAgreementScreen extends StatelessWidget {
  const UserAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCode = appDi.core.get<LocaleEntity>().state.locale.code;

    return Scaffold(
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const AppSliverBar(
            leading: ArrowLeadingButton(),
          ),
          SliverFillRemaining(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(
                  'https://policies.google.com/terms?hl=$localeCode',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
