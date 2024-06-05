import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../env/environment.dart';
import '../interface/i_module_repo.dart';
import '../value_objects/app_module.dart';
import 'states.dart';

export '../value_objects/app_module.dart';
export 'states.dart';

class ModuleEntity extends Cubit<ModuleState> {
  ModuleEntity({
    required this.local,
  }) : super(ModuleState(Environment.module));

  final IModuleRepo local;

  Future<void> read() async {
    final output = await local.read();
    if (output != null) {
      emit(
        ModuleState(output),
      );
    }
  }

  Future<void> switchTo(AppModule module) async {
    if (module == state.module) return;
    await local.write(module);
    emit(
      ModuleState(module),
    );
  }

  Future<void> reload() async {
    emit(
      ModuleState(
        state.module,
        force: true,
      ),
    );

    /// Without this
    /// the module will be reloaded
    /// on every hot reload.
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        emit(ModuleState(state.module));
      },
    );
  }
}
