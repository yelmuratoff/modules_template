import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../shared/presentation/widgets/app_bar/app_sliver_bar.dart';
import '../../../../../../shared/presentation/widgets/app_unfocuser.dart';
import '../../../../../../shared/presentation/widgets/text_fields/phone_textfield.dart';
import '../../../../../../shared/utils/extensions/object_to_error.dart';
import '../../../../../../core/api/backend/domain/entity/core_backend.dart';
import '../../../../../../core/theme/domain/interface/i_theme.dart';
import '../../../../../../core/di/di.dart';
import '../data/repo/phone_change_repo.dart';
import '../domain/entity/phone_change_entity.dart';
import 'widgets/phone_change_mixin.dart';

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({super.key, this.onSuccess});

  final void Function()? onSuccess;

  @override
  State<ChangePhoneScreen> createState() => _ChangePhoneScreenState();
}

class _ChangePhoneScreenState extends State<ChangePhoneScreen>
    with PhoneChangeMixin {
  final phone = PhoneTextfield(
    data: PhoneTextfieldData(
      autofocus: true,
    ),
  );

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneChangeEntity>(
      create: (context) {
        return PhoneChangeEntity(
          remote: PhoneChangeRepo(
            gateway: appDi.core.get<CoreBackend>().gateway,
          ),
        );
      },
      child: AppUnfocuser(
        child: Scaffold(
          body: BlocConsumer<PhoneChangeEntity, ChangeState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomScrollView(
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      AppSliverBar(
                        title: L10n.current.changePhoneNumber,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(child: phone),
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
                              final state =
                                  context.read<PhoneChangeEntity>().state;
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
                                if (phone.data.validate) {
                                  BlocProvider.of<PhoneChangeEntity>(context)
                                      .add(
                                    RequestChange(
                                      phone.data.controller.text,
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(L10n.current.save),
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
                phone.data.showErrors(
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
