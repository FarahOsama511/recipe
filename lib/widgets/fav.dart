import 'package:flutter/material.dart';
import 'package:recipe/helpers/db_helper.dart';
import 'package:recipe/models/RecipeModel.dart';

class favourite extends StatefulWidget {
  final Recipemodel recipemodel;

  const favourite({super.key, required this.recipemodel});

  @override
  State<favourite> createState() => favouriteState();
}

class favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return RecipeProvider.instance.isfavourite[widget.recipemodel.id] == true
        ? IconButton(
            onPressed: () async {
              await RecipeProvider.instance
                  .delet(widget.recipemodel.id)
                  .then((value) {
                RecipeProvider.instance.isfavourite[widget.recipemodel.id] =
                    false;
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ))
        : IconButton(
            onPressed: () async {
              await RecipeProvider.instance
                  .insert(widget.recipemodel)
                  .then((value) {
                RecipeProvider.instance.isfavourite[widget.recipemodel.id] =
                    true;
                setState(() {});
              });
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.white,
            ));
  }
}
