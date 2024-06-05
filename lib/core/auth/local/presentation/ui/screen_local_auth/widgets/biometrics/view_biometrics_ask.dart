import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../l10n/generated/l10n.dart';

import '../../../../../../../../shared/assets.gen.dart';
import '../../../../../../../theme/domain/interface/i_theme.dart';
import '../../../../../domain/entity/extensions.dart';
import '../../../../../domain/value_objects/biometrics_type.dart';
import '../../../../controller/local_auth_controller.dart';
import '../local_auth_view_app_bar.dart';

class ViewBiometricsSetupAsk extends StatelessWidget {
  const ViewBiometricsSetupAsk({
    required this.state,
    super.key,
  });

  final LocalAuthVmBiometricsSetup state;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final type =
        context.read<LocalAuthController>().availableBiometrics?.current;
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
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.04),
              if (state.dto.errorMessage == null)
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.color.accentBg,
                          ),
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            switch (type) {
                              BiometricsType.faceId =>
                                Assets.shared.icons.faceid.path,
                              _ => Assets.shared.icons.fingerprint.path,
                            },
                            width: 20,
                            colorFilter: ColorFilter.mode(
                              context.color.accent,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            type == BiometricsType.faceId
                                ? L10n.current.useBiometry
                                : L10n.current.useFingerprints,
                            style: context.text.hs16w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.04),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: context.button.elevated1,
                            child: Text(L10n.current.allow),
                            onPressed: () {
                              context
                                  .read<LocalAuthController>()
                                  .biometricsSetup(
                                    state.dto.copyWith(
                                      skipAsk: true,
                                    ),
                                  );
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
                            child: Text(L10n.current.no),
                            onPressed: () {
                              context.read<LocalAuthController>().unverified();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              if (state.dto.errorMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        state.dto.errorMessage!,
                        style: context.text.error,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: height * 0.04),
              if (state.dto.errorMessage != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: context.button.elevated2,
                      child: Text(L10n.current.tryAgain),
                      onPressed: () {
                        context.read<LocalAuthController>().biometricsSetup(
                              state.dto,
                            );
                      },
                    ),
                  ],
                ),
              SizedBox(height: height * 0.04),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
