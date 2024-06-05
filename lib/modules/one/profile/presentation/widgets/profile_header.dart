import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../../../../../_shared/assets.gen.dart';
import '../../domain/value_objects/user.dart';
import 'profile/authorized_profile_tile.dart';
import 'profile/unauthorized_profile_tile.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    this.showUi = false,
    this.user,
    super.key,
  });

  final User? user;
  final bool showUi;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      explicitChildNodes: true,
      enabled: true,
      child: Stack(
        children: [
          Semantics(
            sortKey: const OrdinalSortKey(1),
            explicitChildNodes: true,
            excludeSemantics: true,
            enabled: true,
            child: Assets.one.images.bg2.image(
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          if (showUi && user == null)
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.49,
                left: 16,
                right: 16,
              ),
              child: Semantics(
                sortKey: const OrdinalSortKey(2),
                child: const UnAuthorizedProfile(),
              ),
            ),
          if (showUi && user != null)
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.34,
                left: 16,
                right: 16,
              ),
              child: Semantics(
                sortKey: const OrdinalSortKey(2),
                child: AuthorizedProfile(user: user!),
              ),
            ),
        ],
      ),
    );
  }
}
