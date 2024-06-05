import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../../../../shared/presentation/widgets/app_bar/app_app_bar.dart';
import '../../../../../../../core/l10n/domain/entity/locale_entity.dart';
import '../../../../../../../core/di/di.dart';

class UserAgreementScreen extends StatelessWidget {
  const UserAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeCode = appDi.core.get<LocaleEntity>().state.locale.code;
    return Scaffold(
      appBar: const AppAppBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            'https://policies.google.com/terms?hl=$localeCode',
          ),
        ),
      ),
    );
  }
}
