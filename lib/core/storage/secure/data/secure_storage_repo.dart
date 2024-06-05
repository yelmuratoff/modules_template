import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/i_secure_storage_repo.dart';

class SecureStorageRepo implements ISecureStorageRepo {
  const SecureStorageRepo(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    return _storage.delete(key: key);
  }

  @override
  Future<void> write(String key, String value) async {
    return _storage.write(
      key: key,
      value: value,
    );
  }
}
