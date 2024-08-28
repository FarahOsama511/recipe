import 'package:recipe/models/Ingredients.dart';

class Recipedetailsmodel {
  final int time, healthScore;
  final String summary, image, title;
  final List<Ingredients> extendedIngredients;

  Recipedetailsmodel(
      {required this.time,
      required this.summary,
      required this.image,
      required this.title,
      required this.extendedIngredients,
      required this.healthScore});
  factory Recipedetailsmodel.fromjson(Map<String, dynamic> json) {
    return Recipedetailsmodel(
      time: json["readyInMinutes"],
      summary: json["summary"],
      image: json["image"],
      title: json["title"],
      healthScore: json["healthScore"],
      extendedIngredients: (json["extendedIngredients"] as List<dynamic>?)
              ?.map((item) => Ingredients.fromjson(item))
              .toList() ??
          [],
    );
  }
}
