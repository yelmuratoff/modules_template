sealed class EventTheme {}

class InitTheme extends EventTheme {}

class ApplyTheme extends EventTheme {
  ApplyTheme(this.themeID);

  final String? themeID;
}
