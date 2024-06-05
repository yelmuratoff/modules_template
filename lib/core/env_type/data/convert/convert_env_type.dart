import '../../../storage/general/domain/value_objects/storage_vo.dart';
import '../../domain/value_objects/env_type.dart';

extension ConvertEnvType on EnvType {
  static EnvType? fromStorage(StorageVo<String?> value) {
    for (final item in EnvType.values) {
      if (item.name == value.value) {
        return item;
      }
    }
    return null;
  }

  static String get storageName => 'coreEnvType';

  StorageVo<String> toStorage() {
    return StorageVo<String>(
      key: storageName,
      value: name,
    );
  }
}
