import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sc_logger/sc_logger.dart';

import '../../../../environment.dart';
import '../interface/i_env_type_repo.dart';
import '../value_objects/env_type.dart';
import 'states.dart';

export '../value_objects/env_type.dart';
export 'states.dart';

class EnvTypeEntity extends Cubit<EnvTypeState> {
  EnvTypeEntity({
    required this.local,
  }) : super(
          EnvTypeState(Environment.envType),
        );

  final IEnvTypeRepo local;

  Future<void> read() async {
    try {
      final output = await local.read();
      if (output != null) {
        emit(
          EnvTypeState(output),
        );
      }
    } catch (error, stack) {
      Log.error(error, stack, 'EnvTypeEntity.read()');
    }
  }

  Future<void> apply(EnvType type) async {
    await local.write(type);
    emit(
      EnvTypeState(type),
    );
  }
}
