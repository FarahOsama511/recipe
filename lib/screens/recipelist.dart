import 'package:flutter/material.dart';
import 'package:recipe/helpers/apiservice.dart';
import 'package:recipe/models/RecipeModel.dart';
import 'package:recipe/widgets/customappbar.dart';
import 'package:recipe/widgets/recipe.dart';

class Recipelist extends StatefulWidget {
  const Recipelist({super.key});

  @override
  State<Recipelist> createState() => _RecipelistState();
}

class _RecipelistState extends State<Recipelist> {
  Apiservice apiservice = Apiservice();
  Future<List<Recipemodel>> getAllrecipe() async {
    List<Recipemodel> recipes = [];
    final result = await apiservice.getAllrecipe();
    for (var item in result["results"]) {
      recipes.add(Recipemodel.fromjson(item));
    }
    return recipes;
  }

  @override
  void initState() {
    super.initState();
    getAllrecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Recipes List"),
        body: FutureBuilder<List<Recipemodel>>(
            future: getAllrecipe(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  final recipemodel = snapshot.data!;
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return Recipe(recipe: recipemodel[index]);
                      });
                } else {
                  return const Center(
                    child: Text(
                      "Recipes is Empty",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              }
            }));
  }
}
