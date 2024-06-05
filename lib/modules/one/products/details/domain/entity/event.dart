sealed class EventProduct {}

class ReadProduct extends EventProduct {
  ReadProduct(this.id);

  final num id;
}
