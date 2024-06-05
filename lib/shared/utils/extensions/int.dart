extension IntCoreX on int {
  String get toMb => (this / 1024 / 1024).toStringAsFixed(2);
  int get toKb => (this / 1024).round();
}
