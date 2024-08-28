import 'package:flutter/material.dart';
import 'package:recipe/helpers/db_helper.dart';
import 'package:recipe/models/RecipeModel.dart';
import 'package:recipe/widgets/customappbar.dart';
import 'package:recipe/widgets/fav_list.dart';

class Favouritelist extends StatefulWidget {
  const Favouritelist({super.key});

  @override
  State<Favouritelist> createState() => _FavouritelistState();
}

class _FavouritelistState extends State<Favouritelist> {
  RecipeProvider recipeProvider = RecipeProvider();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Favourite List"),
        body: FutureBuilder(
            future: recipeProvider.getrecipe(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  return GridView.builder(
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return FavList(
                          recipe: Recipemodel.fromjson(snapshot.data![index]),
                        );
                      });
                } else {
                  return const Center(
                    child: Text(
                      "favourite List is Empty",
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
