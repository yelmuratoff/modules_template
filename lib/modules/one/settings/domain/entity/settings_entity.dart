import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sc_logger/sc_logger.dart';

import '../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../core/storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../../../core/storage/general/domain/value_objects/storage_vo.dart';
import '../value_objects/settings.dart';
import 'states.dart';

export 'states.dart';

class SettingsEntity extends Cubit<SettingsState> {
  SettingsEntity({
    required this.local,
  }) : super(SettingsIdle());

  final ILocalStorageRepo local;

  Future<void> reset() async {
    try {
      await _delete(_Keys.values);
    } catch (error, stack) {
      Log.error(error, stack, 'SettingsEntity');
    }
  }

  Future<void> read() async {
    try {
      final example = await local.read<bool>(
        _Keys.example.name,
      );
      final output = Settings(example: example.value);
      emit(
        SettingsData(output),
      );
    } catch (_) {
      emit(
        const SettingsError(
          StorageReadException(),
        ),
      );
      rethrow;
    }
  }

  Future<void> apply(Settings settings) async {
    try {
      final futures = <Future>[];
      if (settings.example != null) {
        futures.add(
          local.write(
            StorageVo<bool>(
              key: _Keys.example.name,
              value: settings.example!,
            ),
          ),
        );
      }
      if (futures.isEmpty) return;
      var output = state.settings ?? settings;
      output = output.mergeWith(settings);
      emit(SettingsData(output));
      await Future.wait(futures);
    } catch (_) {
      emit(
        const SettingsError(
          StorageWriteException(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _delete(List<_Keys> keys) async {
    return local.deleteAll(
      keys.map((e) => e.name).toList(),
    );
  }
}

enum _Keys { example }
