sealed class EventQuote {}

class ReadQuote extends EventQuote {
  ReadQuote(this.id);

  final num id;
}
