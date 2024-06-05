import 'dart:async';

import 'package:flutter/foundation.dart';

import 'mixins/verify.dart';

abstract class TwoAuth {
  static late AsyncCallback _onSuccess;

  static AsyncCallback get onSuccess => _onSuccess;

  static Future<bool> verify({
    required AsyncCallback onSuccess,
    bool checkRemoteAuth = true,
    bool checkLocalAuth = true,
  }) {
    _onSuccess = onSuccess;
    return TwoAuthVerify.verify(
      checkRemoteAuth: checkRemoteAuth,
      checkLocalAuth: checkLocalAuth,
    );
  }
}
