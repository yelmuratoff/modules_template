import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/interface/i_local_storage_repo.dart';
import '../domain/value_objects/storage_vo.dart';

class LocalStorageRepo implements ILocalStorageRepo {
  LocalStorageRepo(this._prefs);

  late final SharedPreferences _prefs;

  @override
  Future<void> deleteAll(Iterable<String> keys) {
    return Future.wait(
      [
        for (final key in keys) _prefs.remove(key),
      ],
      eagerError: true,
    );
  }

  @override
  Future<StorageVo<T?>> read<T>(String key) async {
    return StorageVo<T?>(
      key: key,
      value: _prefs.get(key) as T?,
    );
  }

  @override
  Future<void> write(StorageVo dto) {
    switch (dto.value) {
      case bool _:
        return _prefs.setBool(dto.key, dto.value);
      case int _:
        return _prefs.setInt(dto.key, dto.value as int);
      case double _:
        return _prefs.setDouble(dto.key, dto.value as double);
      case String _:
        return _prefs.setString(dto.key, dto.value as String);
      case List<String> _:
        return _prefs.setStringList(dto.key, dto.value as List<String>);
      default:
        throw Exception('Unsupported variable type for local storage');
    }
  }

  @override
  Future<void> writeAll(Iterable<StorageVo> dtos) {
    return Future.wait(
      [
        for (final item in dtos) write(item),
      ],
      eagerError: true,
    );
  }
}
