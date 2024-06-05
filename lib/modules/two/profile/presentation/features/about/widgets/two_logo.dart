import 'package:flutter/material.dart';

import '../../../../../../../shared/assets.gen.dart';
import '../../../../../../../core/env/domain/value_objects/env_type.dart';
import '../../../../../../../core/api/backend/presentation/backend_switcher.dart';
import '../../../../../../../core/theme/domain/interface/i_theme.dart';

class TwoLogo extends StatefulWidget {
  const TwoLogo({super.key});

  @override
  State<TwoLogo> createState() => _TwoLogoState();
}

class _TwoLogoState extends State<TwoLogo> {
  @override
  Widget build(BuildContext context) {
    return BackendSwitcher(
      builder: (envType) {
        return Center(
          child: Stack(
            children: [
              Assets.two.images.logo.image(
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              if (envType != EnvType.prod)
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          envType.name.toUpperCase(),
                          style: context.text.s20w700.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
