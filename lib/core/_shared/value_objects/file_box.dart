import 'dart:core';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';

import 'package:flutter/widgets.dart';

extension ScPickerIntUtils on int {
  String get toMb => (this / 1024 / 1024).toStringAsFixed(2);
  int get toKb => (this / 1024).round();
}

extension ScPickerStringUtils on String? {
  String get fileExt {
    if (this == null || this!.isEmpty) return '';
    final chunks = fileName.split('.');
    if (chunks.length > 1) {
      return chunks.last;
    } else {
      return '';
    }
  }

  String get fileName {
    if (this == null || this!.isEmpty) return '';
    return this!.split('/').last.split('?').first.toLowerCase();
  }

  static String randomText([int length = 10]) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }
}

abstract final class GuessFileType {
  ///Used to guess file type when picking
  ///or getting from network
  static const Map<ScFileboxType, Set<String>> defaultTypings = {
    ScFileboxType.audio: {
      'mp3',
      'm4a',
      'm4b',
      'flac',
      'alac',
      'pcm',
      'aiff',
      'wav',
      'aac',
      'amr',
      'he-aac',
    },
    ScFileboxType.doc: {
      'doc',
      'docx',
      'xls',
      'xlsx',
      'pdf',
    },
    ScFileboxType.image: {
      'png',
      'jpg',
      'jpeg',
      'heic',
    },
    ScFileboxType.svg: {
      'svg',
    },
    ScFileboxType.video: {
      'mp4',
      'mov',
    },
  };

  static ScFileboxType guess(
    String fileExt, {
    Map<ScFileboxType, Set<String>>? typings,
  }) {
    final ext = fileExt.toLowerCase();
    for (final type in (typings ?? defaultTypings).entries) {
      if (type.value.contains(ext)) {
        return type.key;
      }
    }
    return ScFileboxType.unknown;
  }
}

enum ScFileboxError { ok, maxSize, uknown, fileName, fileType }

enum ScFileboxSource { web, user, path }

enum ScFileboxType {
  image,
  svg,
  doc,
  audio,
  video,
  other,
  unknown;
}

@immutable

///Container for file data.\
///`type` is guessed from file extension if not provided.\
///`typings` are used to guess the type.
class ScFilebox {
  ScFilebox({
    this.id,
    this.uri,
    this.bytes,
    ScFileboxType? type,
    this.error = ScFileboxError.ok,
    this.source,
    this.optionalName,
    Map<ScFileboxType, Set<String>> typings = GuessFileType.defaultTypings,
  }) {
    if (type == null) {
      this.type = GuessFileType.guess(
        ext,
        typings: typings,
      );
    } else {
      this.type = type;
    }
  }

  final Uint8List? bytes;
  final ScFileboxError error;
  final String? id;
  final Key key = UniqueKey();

  ///Extra string for additional info
  final String? optionalName;

  final ScFileboxSource? source;
  late final ScFileboxType type;
  final Uri? uri;

  @override
  bool operator ==(covariant ScFilebox other) {
    if (identical(this, other)) return true;

    return other.bytes == bytes &&
        other.error == error &&
        other.id == id &&
        other.optionalName == optionalName &&
        other.source == source &&
        other.type == type &&
        other.uri == uri;
  }

  @override
  int get hashCode {
    return bytes.hashCode ^
        error.hashCode ^
        id.hashCode ^
        optionalName.hashCode ^
        source.hashCode ^
        type.hashCode ^
        uri.hashCode;
  }

  @override
  String toString() {
    return 'FileBox('
        'uri: $uri, '
        'type: ${type.name}, '
        'source: $source, '
        'error: $error'
        'bytes: ${bytes?.length.toMb} Mb '
        ')';
  }

  File? get file {
    if (uri?.scheme != 'file') return null;
    return File(fullPath);
  }

  String get fullPath {
    if (uri?.scheme == 'file') {
      return uri?.toFilePath() ?? '';
    } else {
      return uri?.toString() ?? '';
    }
  }

  String? get name {
    if (uri?.scheme == 'file') {
      return uri?.toFilePath().fileName;
    } else {
      return uri?.path.fileName;
    }
  }

  String get ext => uri?.path.fileExt ?? '';

  ScFilebox copyWith({
    Uint8List? bytes,
    ScFileboxError? error,
    String? id,
    String? optionalName,
    ScFileboxSource? source,
    ScFileboxType? type,
    Uri? uri,
  }) {
    return ScFilebox(
      bytes: bytes ?? this.bytes,
      error: error ?? this.error,
      id: id ?? this.id,
      optionalName: optionalName ?? this.optionalName,
      source: source ?? this.source,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }
}
