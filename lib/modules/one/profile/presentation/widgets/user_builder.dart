import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/widgets/banners/show_banner.dart';
import '../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/di/di.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/value_objects/user.dart';

class UserBuilder extends StatelessWidget {
  const UserBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(User? user, Object? error) builder;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserEntity, UserState>(
      bloc: appDi.current.get<UserEntity>(),
      builder: (context, state) {
        return switch (state) {
          UserLoading _ => const AppProgressIndicator(),
          UserError(error: final error) => builder(null, error),
          UserData(user: final user) => builder(user, null),
          UserDeleted _ => builder(null, null),
          UserIdle() => builder(null, null),
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
