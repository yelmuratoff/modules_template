import 'package:flutter/widgets.dart';

import 'di.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appDi.core.init();
}
