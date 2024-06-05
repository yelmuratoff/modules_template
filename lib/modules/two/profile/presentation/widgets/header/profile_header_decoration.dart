import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../_shared/assets.gen.dart';
import '../../../../../../_shared/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import 'widgets/arc_border_painter.dart';
import 'widgets/arc_shadow_painter.dart';

class ProfileHeaderDecoration extends StatelessWidget {
  const ProfileHeaderDecoration({
    super.key,
    this.image,
    this.children = const [],
  });

  final List<Widget> children;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: w * 0.5226,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          context.color.grey900,
                          context.color.accent,
                          context.color.accent,
                        ],
                        stops: const [0.4, 0.9, 1.0],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(16, w * 0.357, 16, 0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final w = constraints.maxWidth;
                        return CustomPaint(
                          foregroundPainter: const ArcBorderPainter(),
                          painter: ArcShadowPainter(
                            color: context.color.textPrimary.withOpacity(0.4),
                            elevation: 5,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: context.color.background,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(height: w * 0.1283),
                                ...children,
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (image == null)
                    Positioned(
                      top: (w * 0.357) - (w * 0.075),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Assets.two.icons.userCircle.svg(
                          fit: BoxFit.cover,
                          width: w * 0.15,
                          height: w * 0.15,
                        ),
                      ),
                    )
                  else
                    Positioned(
                      top: (w * 0.357) - (w * 0.075),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            width: w * 0.15,
                            height: w * 0.15,
                            imageUrl: image ?? '',
                            placeholder: (_, __) => const AppProgressIndicator(widthFactor: 0.5),
                            errorWidget: (_, url, error) {
                              return Assets.two.icons.userCircle.svg(
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
