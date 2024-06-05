import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di.dart';
import '../../../../_shared/utils/extensions/string.dart';
import '../../../../navigation/navigator1_helper.dart';
import '../domain/entity/module_entity.dart';
import 'module_widget.dart';

class AppModuleSwitcher extends StatefulWidget {
  const AppModuleSwitcher({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppModuleSwitcher> createState() => _AppModuleSwitcherState();
}

class _AppModuleSwitcherState extends State<AppModuleSwitcher> {
  late var _key = ValueKey(''.randomString());
  AppModule? _prev;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModuleEntity, ModuleState>(
      bloc: appDi.core.get(),
      builder: (context, state) {
        if (_prev != state.module || state.force) {
          _key = ValueKey(''.randomString());
          _prev = state.module;
          resetRouter();
        }
        return ModuleWidget(
          key: _key,
          module: state.module,
          child: widget.child,
        );
      },
    );
  }
}
