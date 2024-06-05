extension IntCoreX on int {
  double get toMb => (this / 1024 / 1024).roundToDouble();
  int get toKb => (this / 1024).round();
}
