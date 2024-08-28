import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe/models/Recipedetails.dart';

class Customcontainer extends StatelessWidget {
  final Recipedetailsmodel recipe;

  const Customcontainer({super.key, required this.recipe});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            transformAlignment: Alignment.center,
            width: 120,
            height: 80,
            padding: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey.shade200)),
            child: Text(
              textAlign: TextAlign.center,
              recipe.healthScore.toString(),
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 120,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timelapse_rounded,
                  color: Colors.green[800],
                ),
                Text(
                  " ${recipe.time}mins",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey.shade200)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.food_bank_outlined,
                  color: Colors.green[800],
                ),
                const Text(
                  "ingredients",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
