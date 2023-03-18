import 'package:flutter/material.dart';
import 'package:mealapp2/models/meal.dart';

class FavoritesScreen extends StatelessWidget {

 final List <Meal> favoriteMeal ;

  const FavoritesScreen( this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
      return const Center(
        child: Text("you have no favorites yet - start adding some"),
      );
  }
}
