class Ingredients {
  final int id;
  final String name, image;

  Ingredients({required this.id, required this.name, required this.image});

  factory Ingredients.fromjson(Map<String, dynamic> json) {
    return Ingredients(
        id: json["id"], name: json["name"], image: json["image"]);
  }
}
