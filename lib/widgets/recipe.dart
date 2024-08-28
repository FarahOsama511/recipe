import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe/models/RecipeModel.dart';
import 'package:recipe/screens/recipedetails.dart';
import 'package:recipe/widgets/fav.dart';

class Recipe extends StatefulWidget {
  final Recipemodel recipe;

  const Recipe({super.key, required this.recipe});
  _RecipeState createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            InkWell(
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: Image.network(
                    widget.recipe.image,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .17,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Recipedetails(
                      recipe: widget.recipe,
                    );
                  })).then((value) {
                    setState(() {});
                  });
                }),
            Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(26, 210, 209, 209),
                  child: favourite(recipemodel: widget.recipe),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            widget.recipe.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
