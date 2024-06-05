import 'package:flutter/material.dart';

import '../../l10n/l10n_helper.dart';
import '../../theme/domain/interface/i_theme.dart';
import 'widgets/onboarding_frame.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    required this.onDone,
    super.key,
  });

  final VoidCallback onDone;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  FlutterLogoStyle style = FlutterLogoStyle.markOnly;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        style = FlutterLogoStyle.horizontal;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logo = FlutterLogo(
      duration: const Duration(seconds: 3),
      textColor: Colors.lightBlueAccent,
      style: style,
      size: MediaQuery.of(context).size.width / 2,
    );
    return Material(
      color: context.color.grey900,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Builder(
                        builder: (context) {
                          return Column(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TabBarView(
                                        children: [
                                          OnboardingFrame(
                                            index: 0,
                                            text: 'context.s.onboardingText1',
                                            image: logo,
                                            onTapNext: () {
                                              DefaultTabController.of(context)
                                                  .animateTo(1);
                                            },
                                          ),
                                          OnboardingFrame(
                                            index: 1,
                                            text: 'context.s.onboardingText2',
                                            image: logo,
                                            onTapNext: () {
                                              DefaultTabController.of(context)
                                                  .animateTo(2);
                                            },
                                          ),
                                          OnboardingFrame(
                                            index: 2,
                                            text: 'context.s.onboardingText3',
                                            image: logo,
                                            onTapNext: widget.onDone,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 15,
              child: OutlinedButton(
                onPressed: widget.onDone,
                child: Text(
                  context.s.skip,
                  style: context.text.s16w400.copyWith(
                    color: context.color.background,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
