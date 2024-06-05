import 'package:flutter/foundation.dart';

@immutable
class PrimaryTabsState {
  const PrimaryTabsState(this.index);

  final int index;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrimaryTabsState && other.index == index;
  }

  @override
  int get hashCode => index.hashCode;

  @override
  String toString() => 'PrimaryTabsState(index: $index)';
}
