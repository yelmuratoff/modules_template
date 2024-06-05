// ignore_for_file: unnecessary_lambdas

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../shared/assets.gen.dart';
import '../../../../../../core/auth/combined/presentation/core_auth.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';

class UnAuthorizedProfile extends StatelessWidget {
  const UnAuthorizedProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: const OrdinalSortKey(4),
      explicitChildNodes: true,
      enabled: true,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.color.background,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              spreadRadius: -4,
              blurRadius: 16,
              color: context.color.shadow.withOpacity(.14),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                child: Assets.one.images.avatarPlaceholder.image(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  L10n.current.user,
                  style: context.text.s16w600.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Semantics(
                label: L10n.current.signIn,
                button: true,
                child: InkWell(
                  onTap: () => CoreAuth.signIn(),
                  child: Row(
                    children: [
                      Text(
                        L10n.current.signIn,
                        style: context.text.s16w600.copyWith(
                          color: context.color.accent,
                        ),
                      ),
                      Assets.shared.icons.chevronRight.svg(
                        colorFilter: ColorFilter.mode(
                          context.color.accent,
                          BlendMode.srcIn,
                        ),
                        height: 17,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
