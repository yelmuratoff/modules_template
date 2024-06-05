import '../../../../../storage/general/domain/interface/i_local_storage_repo.dart';
import '../../domain/interface/i_module_repo.dart';
import '../../domain/value_objects/app_module.dart';
import '../convert/convert_app_module.dart';

class ModuleRepo implements IModuleRepo {
  ModuleRepo({required this.storage});

  final ILocalStorageRepo storage;

  @override
  Future<AppModule?> read() async {
    final module = await storage.read<String>(
      AppModuleConvert.storageName,
    );
    return AppModuleConvert.fromStorage(module);
  }

  @override
  Future<void> write(AppModule module) async {
    storage.write(
      module.toStorage(),
    );
  }
}
