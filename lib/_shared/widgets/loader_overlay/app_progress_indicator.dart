import 'package:flutter/material.dart';

import '../../../core/theme/domain/interface/i_theme.dart';

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({
    super.key,
    this.margin,
    this.widthFactor = 0.13,
    this.theme,
  });

  final EdgeInsetsGeometry? margin;
  final ThemeData? theme;
  final double widthFactor;

  @override
  Widget build(BuildContext context) {
    final theme = this.theme ?? context.theme;
    return Theme(
      data: theme,
      child: Builder(
        builder: (context) {
          return Center(
            child: FractionallySizedBox(
              widthFactor: widthFactor,
              child: Container(
                margin: margin,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.color.background,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      offset: const Offset(0, 2),
                      color: theme.color.shadow.withOpacity(0.7),
                    ),
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                      color: theme.color.accent,
                    ),
                  ],
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final size = constraints.maxWidth;
                    return SizedBox(
                      height: size,
                      width: size,
                      child: Center(
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                width: size * 0.9,
                                height: size * 0.9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.color.background,
                                ),
                                child: LinearProgressIndicator(
                                  minHeight: size * 2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
