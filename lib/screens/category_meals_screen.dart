import 'package:flutter/material.dart';
import 'package:mealapp2/Widgets/meal_item.dart';

import 'package:mealapp2/dummy_data.dart';
import 'package:mealapp2/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meal';

  final List < Meal> availableMeal ;
  CategoryMealsScreen(this.availableMeal);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'].toString();
    categoryMeal = widget.availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void removeMeal(String mealId){
    setState(() {
      categoryMeal.removeWhere((meals) => meals.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
            removeItem: removeMeal,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
