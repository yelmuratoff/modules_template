import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../../../_shared/widgets/app_bar/app_sliver_bar.dart';
import '../../../../../../_shared/widgets/app_unfocuser.dart';
import '../../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../../_shared/widgets/text_fields/password_text_field.dart';
import '../../../../../../di.dart';
import '../../../../../_shared/exceptions/app_exception.dart';
import '../../../../../_shared/utils/extensions/object_to_error.dart';
import '../../../../../l10n/l10n_helper.dart';
import '../../../../../network/backend/domain/entity/core_backend.dart';
import '../../../../../theme/domain/interface/i_theme.dart';
import '../../../../combined/presentation/core_auth.dart';
import '../../../_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../_shared/domain/value_objects/auth_response.dart';
import '../data/change_password_repo.dart';
import '../domain/vm/change_password_entity.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({
    required this.resp,
    super.key,
  });

  final AuthResponse resp;

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  late final PasswordTextField password = PasswordTextField(
    data: PasswordTextfieldData(
      onChanged: (_) => password.data.validate,
    ),
  );

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordEntity(
        remote: ChangePasswordRepo(
          gateway: appDi.core.get<CoreBackend>().gateway,
        ),
      ),
      child: AppUnfocuser(
        child: Builder(
          builder: (context) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: BlocListener<ChangePasswordEntity, ChangePasswordState>(
                child: CustomScrollView(
                  slivers: [
                    AppSliverBar(
                      title: context.s.changePassword,
                    ),
                    SliverFillRemaining(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            password,
                            const Spacer(),
                            Row(
                              children: [
                                Expanded(
                                  child: ValueListenableBuilder<bool?>(
                                    valueListenable: password.data.isValidated,
                                    builder: (context, isValidated, child) {
                                      return ElevatedButton(
                                        style: context.button.elevated1,
                                        onPressed: isValidated == true
                                            ? () {
                                                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                                FocusScope.of(context).unfocus();
                                                password.data.clearErrors;
                                                context.read<ChangePasswordEntity>().changePassword(
                                                      uid: widget.resp.uid,
                                                      code: int.parse(widget.resp.code),
                                                      password: password.data.controller.text,
                                                    );
                                              }
                                            : null,
                                        child: Text(context.s.save),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                listener: (context, state) {
                  if (state is ChangePasswordLoading) {
                    context.loaderOverlay.show();
                  } else {
                    context.loaderOverlay.hide();
                  }
                  if (state is ChangePasswordError) {
                    ShowBanner.hide();
                    if (state.error is AuthException) {
                      final error = state.error as AuthException;
                      if (error.password != null) {
                        password.data.showErrors(
                          List.from(error.password!),
                        );
                      }
                      if (error.code != null) {
                        password.data.showErrors(
                          List.from(error.code!),
                        );
                      }
                    } else {
                      ShowBanner.error(
                        message: state.error.toErrorMessage(),
                      );
                    }
                  }
                  if (state is ChangePasswordSuccess) {
                    appDi.core.get<RemoteAuthEntity>().updateAuthVo(state.vo);
                    CoreAuth.onSuccess?.call();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
