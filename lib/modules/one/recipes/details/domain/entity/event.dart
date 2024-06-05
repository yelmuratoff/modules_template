sealed class EventRecipe {}

class ReadRecipe extends EventRecipe {
  ReadRecipe(this.id);

  final num id;
}
