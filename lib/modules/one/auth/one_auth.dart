import 'dart:async';

import 'package:flutter/foundation.dart';

import 'mixins/verify.dart';

abstract class OneAuth {
  static late AsyncCallback _onSuccess;

  static AsyncCallback get onSuccess => _onSuccess;

  static Future<bool> verify({
    required AsyncCallback onSuccess,
    bool checkLocalAuth = true,
    bool checkRemoteAuth = true,
  }) {
    _onSuccess = onSuccess;
    return OneAuthVerify.verify(
      checkLocalAuth: checkLocalAuth,
      checkRemoteAuth: checkRemoteAuth,
    );
  }
}
