import '../../domain/value_objects/app_locale.dart';
import '../../generated/l10n.dart';

extension LocalizedName on AppLocale {
  String get localizedName {
    return switch (this) {
      AppLocale.ru => S.current.russian,
      AppLocale.kk => S.current.kazakh,
    };
  }
}
