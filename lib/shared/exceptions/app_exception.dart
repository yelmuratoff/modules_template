// ignore_for_file: no_runtimetype_tostring

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../core/l10n/generated/l10n.dart';

part 'auth_exception.dart';
part 'backend_exception.dart';
part 'convert_exception.dart';
part 'fb_token_exception.dart';
part 'info_exception.dart';
part 'storage_read_exception.dart';
part 'storage_write_exception.dart';

sealed class AppException extends Equatable implements Exception {
  const AppException([this.debugMessage]);

  final Object? debugMessage;

  @override
  List<Object?> get props => [debugMessage];

  @override
  String toString() {
    var output = runtimeType.toString();
    if (debugMessage != null) output += ': $debugMessage';
    return output;
  }
}
