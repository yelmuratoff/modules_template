import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../../_shared/widgets/divider.dart';
import '../../../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../domain/value_objects/user.dart';

part 'user_data_row.dart';

class AuthorizedProfile extends StatelessWidget {
  const AuthorizedProfile({
    required this.user,
    super.key,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Semantics(
              enabled: true,
              explicitChildNodes: true,
              child: Column(
                children: [
                  const SizedBox(height: 44),
                  Text(
                    user.fullName ?? context.s.noData,
                    style: context.text.hs24w700,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 12),
                  const AppDivider(),
                  const SizedBox(height: 16),
                  _UserDataRow(
                    title: context.s.email,
                    subtitle: user.email ?? context.s.noData,
                  ),
                  const SizedBox(height: 8),
                  _UserDataRow(
                    title: context.s.phoneNumber,
                    subtitle: user.phone ?? context.s.noData,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        FractionalTranslation(
          translation: const Offset(0, -0.5),
          child: Align(
            alignment: FractionalOffset.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.color.background,
                border: Border.all(
                  width: 3,
                  color: context.color.background,
                ),
              ),
              child: ClipOval(
                child: user.image == null
                    ? Assets.one.images.bgImage.image(
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: user.image ?? '',
                        placeholder: (_, __) => const AppProgressIndicator(widthFactor: 0.5),
                        errorWidget: (_, url, error) {
                          return Assets.one.images.bgImage.image(
                            fit: BoxFit.cover,
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
