import 'dart:ui';

import '../../../storage/general/domain/value_objects/storage_vo.dart';
import '../../domain/value_objects/app_locale.dart';

extension AppLocaleConvert on AppLocale {
  static AppLocale? fromStorage(StorageVo? dto) {
    for (final item in AppLocale.values) {
      if (item.name == dto?.value) {
        return item;
      }
    }
    return null;
  }

  static AppLocale? fromLocale(Locale? value) {
    for (final item in AppLocale.values) {
      if (item.name == value?.languageCode) {
        return item;
      }
    }
    return null;
  }

  static String get storageName => 'coreLocale';

  StorageVo<String> toStorage() {
    return StorageVo<String>(
      key: storageName,
      value: name,
    );
  }

  Locale toLocale() {
    return Locale(name);
  }
}
