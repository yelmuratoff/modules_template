import '../value_objects/storage_vo.dart';

abstract class ILocalStorageRepo {
  Future<dynamic> deleteAll(Iterable<String> keys);

  Future<StorageVo<T?>> read<T>(String key);

  ///Value must be one of the following types:<br>
  ///`bool`, `int`, `double`, `String,` `List<String>`
  ///
  ///Throws otherwise
  Future<dynamic> write(StorageVo dto);

  Future<dynamic> writeAll(List<StorageVo> dtos);
}
