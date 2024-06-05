import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../_shared/widgets/divider.dart';
import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/navigation/navigator1_helper.dart';
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
                          context.s.noData,
                          textAlign: TextAlign.center,
                          style: context.text.s16w600,
                        ),
                      )
                    : Text(
                        user?.fullName ?? context.s.noData,
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
          label: context.s.email,
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
          label: context.s.phone,
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
