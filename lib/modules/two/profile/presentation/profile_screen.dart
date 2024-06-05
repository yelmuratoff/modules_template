import 'package:flutter/material.dart';

import '../../../../_shared/widgets/app_error_widget.dart';
import '../../../../_shared/widgets/signout_button/sign_out_button.dart.dart';
import '../../../../di.dart';
import '../../auth/two_auth.dart';
import '../domain/entity/user_entity.dart';
import '../domain/value_objects/user.dart';
import 'widgets/auth_builder.dart';
import 'widgets/builder/user_builder.dart';
import 'widgets/header/profile_header.dart';
import 'widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AuthBuilder(
          builder: (isAuthorized, authError) {
            return UserBuilder(
              builder: ({required bool isLoading, User? user, Object? userError}) {
                return Semantics(
                  explicitChildNodes: true,
                  enabled: true,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ProfileHeader(
                        user: user,
                        isLoading: isLoading,
                      ),
                      if (authError != null)
                        AppErrorWidget(
                          error: authError,
                          onRetry: () {
                            TwoAuth.verify(
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
      ),
    );
  }
}
