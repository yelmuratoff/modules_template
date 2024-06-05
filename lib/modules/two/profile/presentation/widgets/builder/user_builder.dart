import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../../core/l10n/generated/l10n.dart';
import '../../../../../../core/di/di.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../domain/value_objects/user.dart';

class UserBuilder extends StatelessWidget {
  const UserBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function({
    required bool isLoading,
    User? user,
    Object? userError,
  }) builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserEntity, UserState>(
      bloc: appDi.current.get<UserEntity>(),
      builder: (context, state) {
        return switch (state) {
          UserLoading _ => builder(
              user: null,
              userError: null,
              isLoading: true,
            ),
          UserError(error: final error) => builder(
              user: null,
              userError: error,
              isLoading: false,
            ),
          UserData(user: final user) => builder(
              user: user,
              userError: null,
              isLoading: false,
            ),
          UserDeleted _ => builder(
              user: null,
              userError: null,
              isLoading: false,
            ),
          UserIdle() => builder(
              user: null,
              userError: null,
              isLoading: false,
            ),
        };
      },
      listener: (context, state) {
        if (state is UserDeleted) {
          ShowBanner.hide();
          ShowBanner.success(
            message: state.message ?? L10n.of(context).accountIsDeleted,
            seconds: 3,
          );
        }
      },
    );
  }
}
