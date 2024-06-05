import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di.dart';
import '../../../../theme/domain/entity/theme_entity.dart';
import '../../../../theme/domain/interface/i_theme.dart';
import '../../di/i_module_di.dart';

class ModuleWidget extends StatefulWidget {
  const ModuleWidget({
    required this.child,
    required this.module,
    super.key,
  });

  final Widget child;
  final AppModule module;

  @override
  State<ModuleWidget> createState() => _ModuleWidgetState();
}

class _ModuleWidgetState extends State<ModuleWidget> {
  final completer = Completer<bool>();
  late IModuleDi di;

  @override
  Future<void> dispose() async {
    di.dispose();
    super.dispose();
  }

  @override
  void initState() {
    di = appDi.createDiFor(widget.module);
    appDi.modules[widget.module] = di;
    di.init();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        di.allReady().whenComplete(() {
          completer.complete(true);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: completer.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        }
        return BlocBuilder<ThemeEntity, ITheme>(
          bloc: di.get<ThemeEntity>(),
          builder: (context, theme) {
            return Theme(
              data: theme.data,
              child: widget.child,
            );
          },
        );
      },
    );
  }
}
