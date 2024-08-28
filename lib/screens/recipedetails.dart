import 'package:flutter/material.dart';
import 'package:recipe/helpers/apiservice.dart';
import 'package:recipe/models/RecipeModel.dart';
import 'package:recipe/models/Recipedetails.dart';
import 'package:recipe/screens/recipelist.dart';
import 'package:recipe/widgets/customcontainer.dart';
import 'package:recipe/widgets/fav.dart';
import 'package:recipe/widgets/ingredientsList.dart';

class Recipedetails extends StatefulWidget {
  final Recipemodel recipe;

  const Recipedetails({super.key, required this.recipe});
  _RecipedetailsState createState() => _RecipedetailsState();
}

class _RecipedetailsState extends State<Recipedetails> {
  Apiservice apiService = Apiservice();
  Future<Recipedetailsmodel> getAlldetails() async {
    final result = await apiService.getAlldetails(widget.recipe.id);
    return Recipedetailsmodel.fromjson(result);
  }

  @override
  void initState() {
    super.initState();
    getAlldetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green[800],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              favourite(recipemodel: widget.recipe),
              const Icon(
                Icons.play_arrow_outlined,
                size: 27,
              ),
              const Icon(
                Icons.shopping_cart_outlined,
                size: 27,
              ),
              const Icon(
                Icons.share,
                size: 27,
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<Recipedetailsmodel>(
        future: getAlldetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
            );
          } else if (snapshot.hasData) {
            final recipeDetails = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    recipeDetails.image,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 10),
                    child: Text(
                      recipeDetails.title,
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Customcontainer(
                      recipe: recipeDetails,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(recipeDetails.summary),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        const Text(
                          "4 Serving",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 230),
                        Container(
                          alignment: Alignment.center,
                          transformAlignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.fromARGB(255, 15, 63, 17),
                              width: 1.5,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            minWidth: 0,
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          transformAlignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.fromARGB(255, 15, 63, 17),
                              width: 1.5,
                            ),
                          ),
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            minWidth: 0,
                            onPressed: () {},
                            child: const Icon(
                              Icons.minimize,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ingredient's",
                          style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 15, 63, 17),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text("Add to Grocery List"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  IngredientList(
                    extendedIngredients: recipeDetails.extendedIngredients,
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Recipe is Empty",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            );
          }
        },
      ),
    );
  }
}
