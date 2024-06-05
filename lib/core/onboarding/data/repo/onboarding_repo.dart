import 'package:sc_logger/sc_logger.dart';

import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../storage/general/domain/value_objects/storage_vo.dart';
import '../../domain/interface/i_onboarding_repo.dart';

class OnboardingRepo implements IOnboardingRepo {
  OnboardingRepo({required this.storage});

  String key = 'isOnboardingDismissed';
  final ILocalStorageRepo storage;

  @override
  Future<bool> isDismissed() async {
    try {
      final output = await storage.read<bool>(key);
      return output.value ?? false;
    } catch (error, stack) {
      Log.error(error, stack, 'OnboardingRepo.isDismissed()');
      return false;
    }
  }

  @override
  Future<void> saveDismissed() async {
    try {
      storage.write(
        StorageVo<bool>(
          key: key,
          value: true,
        ),
      );
    } catch (error, stack) {
      Log.error(error, stack, 'OnboardingRepo.save()');
    }
  }
}
