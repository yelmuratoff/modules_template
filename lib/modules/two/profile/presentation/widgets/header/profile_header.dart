import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../shared/presentation/widgets/divider.dart';
import '../../../../../../core/router/navigator1_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../_shared/features/settings/change_email/presentation/change_email_screen.dart';
import '../../../../../_shared/features/settings/change_phone/presentation/change_phone_screen.dart';
import '../../../domain/value_objects/user.dart';
import 'profile_header_decoration.dart';
import 'widgets/header_tile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    required this.user,
    required this.isLoading,
    super.key,
  });

  final bool isLoading;
  final User? user;

  @override
  Widget build(BuildContext context) {
    return ProfileHeaderDecoration(
      image: user?.image,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: isLoading
                    ? Shimmer.fromColors(
                        baseColor: context.color.background,
                        highlightColor: context.color.grey900,
                        child: Text(
                          L10n.current.noData,
                          textAlign: TextAlign.center,
                          style: context.text.s16w600,
                        ),
                      )
                    : Text(
                        user?.fullName ?? L10n.current.noData,
                        textAlign: TextAlign.center,
                        style: context.text.s16w600,
                      ),
              ),
            ),
          ],
        ),
        const AppDivider(
          margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
        ),
        HeaderTile(
          label: L10n.current.email,
          value: user?.email,
          isLoading: isLoading,
          onPressed: () {
            context.router.use.push(
              const ChangeEmailScreen(),
            );
          },
        ),
        const SizedBox(height: 12),
        HeaderTile(
          label: L10n.current.phone,
          value: user?.phone,
          isLoading: isLoading,
          onPressed: () {
            context.router.use.push(
              const ChangePhoneScreen(),
            );
          },
        ),
      ],
    );
  }
}
