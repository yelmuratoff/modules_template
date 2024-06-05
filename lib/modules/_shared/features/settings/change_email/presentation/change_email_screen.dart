import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../_shared/widgets/app_bar/app_sliver_bar.dart';
import '../../../../../../_shared/widgets/app_unfocuser.dart';
import '../../../../../../_shared/widgets/text_fields/email_textfield.dart';
import '../../../../../../core/_shared/utils/extensions/object_to_error.dart';
import '../../../../../../core/l10n/l10n_helper.dart';
import '../../../../../../core/network/backend/domain/entity/core_backend.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../di.dart';
import '../data/repo/email_change_repo.dart';
import '../domain/entity/email_change_entity.dart';
import 'widgets/email_change_mixin.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key, this.onSuccess});

  final void Function()? onSuccess;

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> with EmailChangeMixin {
  final email = EmailTextfield(
    data: EmailTextfieldData(
      autofocus: true,
    ),
  );

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailChangeEntity>(
      create: (context) {
        return EmailChangeEntity(
          remote: EmailChangeRepo(
            gateway: appDi.core.get<CoreBackend>().gateway,
          ),
        );
      },
      child: AppUnfocuser(
        child: Scaffold(
          body: BlocConsumer<EmailChangeEntity, ChangeState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomScrollView(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      AppSliverBar(
                        title: context.s.changeEmail,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(child: email),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: context.button.elevated1,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              final state = context.read<EmailChangeEntity>().state;
                              var remainingSeconds = 0;
                              if (state is ChangeCode) {
                                remainingSeconds = state.resp.code;
                              }
                              if (remainingSeconds > 0) {
                                showCodeConfirmation(
                                  context,
                                  (state as ChangeCode).resp,
                                );
                              } else {
                                if (email.data.validate) {
                                  BlocProvider.of<EmailChangeEntity>(context).add(
                                    RequestChange(
                                      email.data.controller.text,
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              context.s.save,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
            listener: (context, state) async {
              if (state is ChangeLoading) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
              if (state is ChangeError) {
                email.data.showErrors(
                  state.error.toErrorMessages().toList(),
                );
              }
              if (state is ChangeCode && state.resp.timeout != null) {
                showCodeConfirmation(context, state.resp);
              }
              if (state is ChangeSuccess) {
                {
                  widget.onSuccess?.call();
                  showSuccessMessage(context).whenComplete(
                    () {
                      if (mounted) Navigator.of(context).pop();
                    },
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
