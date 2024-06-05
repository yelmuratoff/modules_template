import '../../../../../storage/general/domain/value_objects/storage_vo.dart';
import '../../domain/value_objects/app_module.dart';

extension AppModuleConvert on AppModule {
  static AppModule? fromStorage(StorageVo<String?> dto) {
    for (final item in AppModule.values) {
      if (item.name == dto.value) {
        return item;
      }
    }
    return null;
  }

  static String get storageName => 'coreModule';

  StorageVo<String> toStorage() {
    return StorageVo<String>(
      key: storageName,
      value: name,
    );
  }
}
