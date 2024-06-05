import 'package:flutter/material.dart';

import '../../../theme/domain/interface/i_theme.dart';

class OnboardingFrame extends StatelessWidget {
  const OnboardingFrame({
    required this.text,
    required this.image,
    required this.onTapNext,
    required this.index,
    super.key,
  });

  final Widget image;
  final int index;
  final VoidCallback onTapNext;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: image),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: context.color.background,
            boxShadow: [
              BoxShadow(
                color: context.color.textPrimary.withOpacity(0.4),
                blurRadius: 14,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20,
                        color: context.color.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      3,
                      (index) => this.index == index ? const _Dash() : const _Dot(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: context.color.accent,
                      padding: const EdgeInsets.all(14),
                      elevation: 6,
                      shadowColor: context.color.textPrimary,
                    ),
                    onPressed: onTapNext,
                    child: const Icon(
                      Icons.arrow_forward,
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

class _Dash extends StatelessWidget {
  const _Dash();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 6,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: context.color.accent,
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.color.grey700,
      ),
    );
  }
}
