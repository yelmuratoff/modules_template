import 'package:equatable/equatable.dart';

import '../value_objects/settings.dart';

sealed class SettingsState {
  const SettingsState();

  Settings? get settings => this is SettingsData ? (this as SettingsData).settings : null;
}

class SettingsIdle extends SettingsState {}

class SettingsData extends SettingsState with EquatableMixin {
  const SettingsData(this.settings);

  @override
  final Settings settings;

  @override
  List<Object> get props => [settings];
}

class SettingsError extends SettingsState with EquatableMixin {
  const SettingsError(this.error);

  final Object error;

  @override
  List<Object> get props => [error];
}
