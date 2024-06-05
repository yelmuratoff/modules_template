import 'dart:async';

abstract class ISecureStorageRepo {
  Future<String?> read(String key);

  Future<void> delete(String key);

  Future<void> write(String key, String value);
}
