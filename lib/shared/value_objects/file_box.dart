import 'dart:core';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';

import '../utils/extensions/int.dart';
import '../utils/extensions/string.dart';

abstract final class GuessFileType {
  ///Used to guess file type when picking
  ///or getting from network
  static const Map<FileboxType, Set<String>> defaultTypings = {
    FileboxType.audio: {
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
    FileboxType.doc: {
      'doc',
      'docx',
      'xls',
      'xlsx',
      'pdf',
    },
    FileboxType.image: {
      'png',
      'jpg',
      'jpeg',
      'heic',
    },
    FileboxType.svg: {
      'svg',
    },
    FileboxType.video: {
      'mp4',
      'mov',
    },
  };

  static FileboxType guess(
    String fileExt, {
    Map<FileboxType, Set<String>>? typings,
  }) {
    final ext = fileExt.toLowerCase();
    for (final type in (typings ?? defaultTypings).entries) {
      if (type.value.contains(ext)) {
        return type.key;
      }
    }
    return FileboxType.unknown;
  }
}

enum FileboxError { ok, maxSize, uknown, fileName, fileType }

enum FileboxSource { web, user, path }

enum FileboxType {
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
class Filebox {
  Filebox({
    this.id,
    this.uri,
    this.bytes,
    FileboxType? type,
    this.error = FileboxError.ok,
    this.source,
    this.optionalName,
    Map<FileboxType, Set<String>> typings = GuessFileType.defaultTypings,
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
  final FileboxError error;
  final String? id;
  final Key key = UniqueKey();

  ///Extra string for additional info
  final String? optionalName;

  final FileboxSource? source;
  late final FileboxType type;
  final Uri? uri;

  @override
  bool operator ==(covariant Filebox other) {
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

  Filebox copyWith({
    Uint8List? bytes,
    FileboxError? error,
    String? id,
    String? optionalName,
    FileboxSource? source,
    FileboxType? type,
    Uri? uri,
  }) {
    return Filebox(
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
