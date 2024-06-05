import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/app_error_widget.dart';
import '../../../../shared/presentation/widgets/signout_button/sign_out_button.dart';
import '../../../../core/di/di.dart';
import '../../auth/one_auth.dart';
import '../domain/entity/user_entity.dart';
import 'widgets/auth_builder.dart';
import 'widgets/profile_body.dart';
import 'widgets/profile_header.dart';
import 'widgets/user_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBuilder(
        builder: (isAuthorized, authError) {
          return UserBuilder(
            builder: (user, userError) {
              return Semantics(
                explicitChildNodes: true,
                enabled: true,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ProfileHeader(
                      user: user,
                      showUi: authError == null && userError == null,
                    ),
                    if (authError != null)
                      AppErrorWidget(
                        error: authError,
                        onRetry: () {
                          OneAuth.verify(
                            onSuccess: () async {},
                          );
                        },
                      )
                    else if (userError != null)
                      AppErrorWidget(
                        error: userError,
                        onRetry: () {
                          appDi.current.get<UserEntity>().read();
                        },
                      ),
                    ProfileBody(showSettings: isAuthorized && user != null),
                    if (isAuthorized)
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: SignOutButton.tile(),
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
