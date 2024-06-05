import 'package:flutter/material.dart';

import '../../../../core/theme/domain/interface/i_theme.dart';
import 'leading_buttons/arrow_leading_button.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    this.actions = const [],
    this.bottom,
    this.canPop = true,
    this.height = kToolbarHeight,
    this.leading,
    this.padding,
    this.title,
    this.child,
    this.backgroundColor,
    this.centerTitle = true,
    this.titleStyle,
  });

  final List<Widget> actions;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool canPop;
  final bool centerTitle;
  final double height;
  final Widget? leading;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final Widget? child;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var title = child;
    if (title == null) {
      if (this.title == null) {
        title = const SizedBox.shrink();
      } else {
        title = Text(
          this.title!,
          maxLines: 3,
          textAlign: centerTitle ? TextAlign.center : null,
          style: titleStyle ?? context.text.hs16w700,
        );
      }
    }
    Widget? leading;
    if (canPop) {
      leading = this.leading;
      leading ??= const ArrowLeadingButton();
    }

    return Container(
      padding: padding,
      child: AppBar(
        centerTitle: centerTitle,
        titleSpacing: 0,
        toolbarHeight: height,
        backgroundColor: backgroundColor ?? context.color.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: leading,
        title: title,
        bottom: bottom,
        actions: actions.isNotEmpty
            ? actions
            : [
                const SizedBox(
                  width: 56,
                  height: 40,
                ),
              ],
      ),
    );
  }
}
