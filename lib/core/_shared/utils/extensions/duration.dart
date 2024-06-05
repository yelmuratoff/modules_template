extension DurationCoreX on Duration {
  String formattedDhms() {
    return [
      inHours.remainder(24),
      inMinutes.remainder(60),
      inSeconds.remainder(60),
    ].map((e) {
      return e.toString().padLeft(2, '0');
    }).join(':');
  }
}
