import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../../env/domain/entity/env_type_entity.dart';
import '../../../env/presentation/env_sheet.dart';

class BackendSwitcher extends StatefulWidget {
  const BackendSwitcher({
    required this.builder,
    this.taps = 5,
    super.key,
  });

  final Widget Function(EnvType envType) builder;
  final int taps;

  @override
  State<BackendSwitcher> createState() => _BackendSwitcherState();
}

class _BackendSwitcherState extends State<BackendSwitcher> {
  int taps = 0;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnvTypeEntity, EnvTypeState>(
      bloc: appDi.core.get(),
      builder: (context, state) {
        return GestureDetector(
          child: widget.builder(state.envType),
          onTap: () async {
            taps++;
            if (taps > widget.taps) {
              showEnvSheet(
                context,
                state.envType,
              ).then(
                (selected) {
                  if (selected == null) return;
                  appDi.core.get<EnvTypeEntity>().apply(selected);
                },
              );
            }
            timer?.cancel();
            timer = Timer(
              const Duration(milliseconds: 200),
              () {
                taps = 0;
              },
            );
          },
        );
      },
    );
  }
}
