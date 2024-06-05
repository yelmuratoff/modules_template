import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/l10n/generated/l10n.dart';
import '../../../core/theme/domain/interface/i_theme.dart';
import '../knob.dart';
import 'widgets/body.dart';
import 'widgets/vmodel.dart';
import 'widgets/waiting.dart';

Future<bool?> showSmsSheet(
  BuildContext context, {
  required VoidCallback onRepeatSmsRequest,
  required Function(String pin) onSuccess,
  String? correctCode,
  String? title,
  String? subtitle,
  DateTime? timeout,
  Duration timeoutDuration = const Duration(seconds: 10),
  int maxAttempts = 5,
  bool canPop = true,
  bool showInitialError = false,
  String? errorMessage,
  int codeLength = 6,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) {
          return SmsVerificationVmodel(
            correctCode: correctCode,
            errorMessage: errorMessage ?? S.current.wrongCode,
            timeoutDuration: timeoutDuration,
            maxAttempts: maxAttempts,
            showInitialError: showInitialError,
            length: codeLength,
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Knob(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    if (title != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              title,
                              style: context.text.hs16w700,
                            ),
                          ),
                        ],
                      ),
                    if (subtitle != null)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                subtitle,
                                textAlign: TextAlign.center,
                                style: context.text.s14w400.copyWith(
                                  color: context.color.grey900,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    BlocConsumer<SmsVerificationVmodel, StateCubitViewPinCode>(
                      builder: (context, state) {
                        late final Widget child;
                        if (state.tooManyAttempts) {
                          child = const SmsVerificationWaiting();
                        } else {
                          child = SmsVerificationBody(
                            isPop: canPop,
                            timeout: timeout,
                            onRepeatSmsRequest: onRepeatSmsRequest,
                            length: codeLength,
                          );
                        }
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, animation) =>
                              SizeTransition(
                            axisAlignment: -1,
                            sizeFactor: animation,
                            child: child,
                          ),
                          layoutBuilder: (
                            Widget? currentChild,
                            List<Widget> previousChildren,
                          ) {
                            return Column(
                              children: <Widget>[
                                if (currentChild != null) currentChild,
                                ...previousChildren,
                              ],
                            );
                          },
                          child: child,
                        );
                      },
                      listener: (context, state) async {
                        if (state.isValidated) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pop(context);
                            onSuccess(state.pinString);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
