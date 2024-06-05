import '../di/i_module_di.dart';

export '../di/i_module_di.dart';
export 'package:get_it/get_it.dart';

///Base class for a feature DI.\
///Contains a `Orchestrator` instance.
///Provides  methods for init and reset.
abstract class IDependencies {
  ///Can be used to register dependencies in a group.\
  ///Every dependency will be registered recursively.
  List<IDependencies> dependencies = [];

  void register(IModuleDi coreDi, IModuleDi moduleDi);
}
