import 'package:flutter/material.dart';
import 'package:recipe/models/Ingredients.dart';

class IngredientList extends StatelessWidget {
  final List<Ingredients> extendedIngredients;
  const IngredientList({
    super.key,
    required this.extendedIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                CircleAvatar(radius: 5, backgroundColor: Colors.green[800]),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    extendedIngredients[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 20,
        ),
      ),
    );
  }
}
