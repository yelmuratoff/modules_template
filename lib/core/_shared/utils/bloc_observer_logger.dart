import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sc_logger/sc_logger.dart';

class BlocObserverLogger extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    Log.w(
      {
        'prev': change.currentState,
        'next': change.nextState,
      },
      bloc.runtimeType.toString(),
    );
  }
}
