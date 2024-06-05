import '../../../../../_shared/widgets/banners/show_banner.dart';
import '../../../../../core/_shared/app_global_keys.dart';
import '../../../../../core/di/module/di/i_module_di.dart';
import '../../../../../core/l10n/generated/l10n.dart';
import '../../../../../core/navigation/navigator1_helper.dart';
import '../../../profile/domain/entity/interactor.dart';

abstract class UserPart {
  static UserInteractor get(IModuleDi moduleDi) {
    return UserInteractor(
      entity: moduleDi.get(),
      onDelete: (state) {
        ShowBanner.success(
          message: state.message ?? S.current.accountIsDeleted,
          seconds: 3,
        );
        Future.delayed(
          const Duration(seconds: 5),
          () {
            AppGlobalKeys.navigator.currentState?.use.pushSignOutScreen();
          },
        );
      },
    );
  }
}
