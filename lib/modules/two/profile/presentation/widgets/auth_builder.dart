import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/presentation/widgets/loader_overlay/app_progress_indicator.dart';
import '../../../../../core/auth/remote/_shared/domain/remote_auth_entity/remote_auth_entity.dart';
import '../../../../../core/di/di.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isAuthorized, Object? error) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteAuthEntity, RemoteAuthState>(
      bloc: appDi.core.get<RemoteAuthEntity>(),
      builder: (context, state) {
        return switch (state) {
          RemoteAuthIdle() => const SizedBox.shrink(),
          RemoteAuthLoading _ => const AppProgressIndicator(),
          RemoteAuthError(error: final error) => builder(false, error),
          RemoteAuthSignedIn _ => builder(true, null),
          RemoteAuthSignedOut _ => builder(false, null),
        };
      },
    );
  }
}
