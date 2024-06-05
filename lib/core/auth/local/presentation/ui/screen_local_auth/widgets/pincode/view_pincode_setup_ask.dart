import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../l10n/l10n_helper.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../controller/local_auth_controller.dart';
import '../../widgets/local_auth_view_app_bar.dart';

class ViewPincodeSetupAsk extends StatelessWidget {
  const ViewPincodeSetupAsk({
    required this.state,
    super.key,
  });

  final LocalAuthVmPinSetupAsk state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        if (state.dto.canPop)
          LocalAuthViewAppBar(
            onCancel: () {
              context.read<LocalAuthController>().unverified();
            },
          ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${context.s.useAccessCode}?',
                      textAlign: TextAlign.center,
                      style: context.text.hs16w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: context.button.elevated1,
                      child: Text(context.s.use),
                      onPressed: () {
                        context
                            .read<LocalAuthController>()
                            .pinSetupSetCode(state.dto);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: context.button.outline1,
                      child: Text(context.s.no),
                      onPressed: () {
                        context.read<LocalAuthController>().unverified();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
