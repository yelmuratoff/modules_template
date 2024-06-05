import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_progress_indicator.dart';

class AppLoaderStack extends StatelessWidget {
  const AppLoaderStack({
    required this.child,
    super.key,
  });

  final Widget child;

  static AppLoaderStackVmodel show(BuildContext context) {
    final vmodel = context.read<AppLoaderStackVmodel>();
    return vmodel..show();
  }

  static void hide(BuildContext context) {
    context.read<AppLoaderStackVmodel>().hide();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLoaderStackVmodel(),
      child: Consumer<AppLoaderStackVmodel>(
        builder: (context, vmodel, _) {
          return Stack(
            children: [
              child,
              if (vmodel._isLoading)
                Positioned.fill(
                  child: ColoredBox(
                    color: Colors.black.withOpacity(0.45),
                    child: const AppProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AppLoaderStackVmodel extends ChangeNotifier {
  bool _isLoading = false;

  void hide() {
    if (_isLoading == false) return;
    _isLoading = false;
    notifyListeners();
  }

  void show() {
    if (_isLoading == true) return;
    _isLoading = true;
    notifyListeners();
  }
}
