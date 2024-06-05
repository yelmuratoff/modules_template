import 'package:equatable/equatable.dart';

import '../../../../../_shared/utils/extensions/string.dart';
import '../value_objects/app_module.dart';

class ModuleState with EquatableMixin {
  ModuleState(
    this.module, {
    bool force = false,
  }) {
    if (force) {
      _uid = ''.randomString();
    }
  }

  final AppModule module;

  String? _uid;

  @override
  List<Object?> get props => [module, _uid];

  bool get force => _uid != null;
}
