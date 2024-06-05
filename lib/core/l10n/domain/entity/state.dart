import 'package:equatable/equatable.dart';

import '../value_objects/app_locale.dart';

class LocaleState extends Equatable {
  const LocaleState(this.locale);

  final AppLocale locale;

  @override
  List<Object> get props => [locale];
}
