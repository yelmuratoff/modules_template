import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocCoreX on Bloc {
  ///Allows for bloc to handle an event
  ///awaiting for any of the [awaitForStates] to occur
  //and returning the state
  Future handleEvent(
    dynamic event, {
    required List awaitForStates,
    bool Function(dynamic state)? validator,
  }) {
    final completer = Completer();
    late StreamSubscription subsc;
    subsc = stream.listen(
      (state) {
        if (awaitForStates.contains(state.runtimeType)) {
          final isValidated = validator?.call(state) ?? true;
          if (awaitForStates.isEmpty || isValidated) {
            subsc.cancel();
            completer.complete(state);
          }
        }
      },
    );
    add(event);
    return completer.future;
  }
}
