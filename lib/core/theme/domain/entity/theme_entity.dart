import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/module/switcher/domain/value_objects/app_module.dart';
import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../../storage/general/domain/value_objects/storage_vo.dart';
import '../interface/i_theme.dart';
import 'event.dart';

export 'event.dart';

class ThemeEntity extends Bloc<EventTheme, ITheme> {
  ThemeEntity({
    required this.themes,
    required this.local,
    required this.module,
  }) : super(themes.first) {
    assert(themes.isNotEmpty, 'At least one theme must be provided');
    on<InitTheme>(_init);
    on<ApplyTheme>(_apply);
  }

  final ILocalStorageRepo local;
  final AppModule module;
  final List<ITheme> themes;

  Future<void> _init(
    InitTheme event,
    Emitter<ITheme> emit,
  ) async {
    final themeID = await local.read<String>(_storageKey);

    await _apply(
      ApplyTheme(themeID.value),
      emit,
    );
  }

  Future<void> _apply(
    ApplyTheme event,
    Emitter<ITheme> emit,
  ) async {
    final theme = _themeFromID(event.themeID);
    if (theme == null) return;
    emit(theme);
    local.write(
      StorageVo(
        key: _storageKey,
        value: theme.id,
      ),
    );
  }

  ITheme? _themeFromID(String? themeID) {
    if (themeID == null) return null;
    return themes.firstWhereOrNull(
      (theme) => theme.id == themeID,
    );
  }

  String get _storageKey => '${module.name}_theme';
}
