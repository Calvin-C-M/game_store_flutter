class Game {
  String name;
  String price;
  String description;
  String thumbnail;
  List<String> tags;
  bool saved;

  Game({
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.tags,
    this.saved = false,
  });
}