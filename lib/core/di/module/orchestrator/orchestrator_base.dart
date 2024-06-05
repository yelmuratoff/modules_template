import 'dart:async';

import 'package:sc_logger/sc_logger.dart';

import '../../../_shared/interface/i_disposable.dart';
import '../di/i_module_di.dart';

///Orchestrator is a class responsible for init/dispose enities
///and interactions between them.
base class OrchestratorBase {
  OrchestratorBase(this.coreDi, this.moduleDi);

  final IModuleDi coreDi;
  final IModuleDi moduleDi;

  final interactors = <IDisposable>[];

  ///The starting point.\
  ///Must call `interactors.add()` to register any interactors needed.\
  ///For example, here we can start listening to an entity
  ///and update some data in another entity.

  Future<void> init() async {}

  Future<void> dispose() async {
    try {
      final futures = interactors.map((e) => e.dispose()).toList();
      await Future.wait(futures);
    } catch (e, stack) {
      Log.error(e, stack, '$runtimeType orchestrator dispose');
      rethrow;
    }
  }

  ///Extra method, can be used for anything\
  ///Example of usage:
  ///can be caled after sign_in to init module settings
  Future<void> initData() async {}

  ///Loads unprotected data first,
  ///then loads protected data if core auth token
  ///is not null, that is, the user is authenticated
  Future<void> loadAllData() {
    return Future.wait([
      loadUnprotectedData(),
      loadProtectedData(),
    ]);
  }

  ///Loads data which IS NOT accessible without auth
  Future<void> loadProtectedData() async {}

  ///Loads data which is accessible without auth
  Future<void> loadUnprotectedData() async {}
}
