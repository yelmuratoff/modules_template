import 'package:flutter/material.dart';

import '../../../core/l10n/generated/l10n.dart';
import '../../../core/theme/domain/interface/i_theme.dart';
import '../../utils/extensions/object_to_error.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.error,
    this.message,
    this.subMessage,
    this.onRetry,
    this.buttonLabel,
    this.child,
    this.header,
    this.icon,
  });

  final Object? error;
  final String? buttonLabel;
  final Widget? child;
  final Widget? header;
  final String? message;
  final VoidCallback? onRetry;
  final String? subMessage;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          if (header != null) header!,
          icon ?? const Icon(Icons.error),
          const SizedBox(height: 16),
          if (child != null)
            Row(
              children: [
                Expanded(child: child!),
              ],
            ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                message ?? L10n.current.somethingWentWrong,
                style: context.text.hs20w700,
                textAlign: TextAlign.center,
              ),
            ),
          if (error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                error!.toErrorMessage(),
                style: context.text.hs20w700,
                textAlign: TextAlign.center,
              ),
            ),
          if (subMessage != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                subMessage!,
                style: context.text.s14w400.copyWith(
                  color: context.color.grey900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          if (onRetry != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: ElevatedButton(
                style: context.button.text4,
                onPressed: onRetry,
                child: Text(
                  buttonLabel ?? L10n.current.tryAgain,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
