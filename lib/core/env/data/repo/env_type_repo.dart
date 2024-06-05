import '../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../domain/interface/i_env_type_repo.dart';
import '../../domain/value_objects/env_type.dart';
import '../convert/convert_env_type.dart';

class EnvTypeRepo implements IEnvTypeRepo {
  EnvTypeRepo({required this.storage});

  final ILocalStorageRepo storage;

  @override
  Future<EnvType?> read() async {
    final output = await storage.read<String>(ConvertEnvType.storageName);
    return ConvertEnvType.fromStorage(output);
  }

  @override
  Future<void> write(EnvType type) async {
    return storage.write(
      type.toStorage(),
    );
  }
}
