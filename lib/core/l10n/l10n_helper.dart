import 'package:flutter/widgets.dart';

import 'generated/l10n.dart';

extension L10nUtils on BuildContext {
  S get s => S.of(this);
}
