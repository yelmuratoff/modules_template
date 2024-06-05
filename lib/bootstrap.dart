import 'package:flutter/widgets.dart';
import 'package:ispect/ispect.dart';

import 'core/_shared/utils/extensions/talker.dart';
import 'di.dart';

///  It is used to handle errors and log messages in the app.
final talker = TalkerFlutter.init();

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  talker.info('📱 App started');
  talkerWrapper
    ..initHandling(talker: talker)
    ..info('🚀 App initialization started');
  await appDi.core.init();
  talkerWrapper.info('🎉 Initialization completed');
}
