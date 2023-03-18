import 'package:flutter/material.dart';
import 'package:mealapp2/dummy_data.dart';
import 'package:mealapp2/models/meal.dart';
import 'package:mealapp2/screens/category_meals_screen.dart';
import 'package:mealapp2/screens/filters_screen.dart';
import 'package:mealapp2/screens/meal_detail_screen.dart';
import 'package:mealapp2/screens/tabs_screen.dart';

import 'screens/category_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "Gluten": false,
    "Lactose": false,
    "Vegan": false,
    "Vegetarian": false
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeal = [];

  void toggleFavorite(String mealId) {

    final existingIndex = favoriteMeal.indexWhere((meal) => meal.id == mealId);


    if (existingIndex >= 0) {
      setState(() {
        favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters["Gluten"] == true && !meal.isGlutenFree) {
          return false;
        }
        if (filters["Lactose"] == true && !meal.isLactoseFree) {
          return false;
        }
        if (filters["Vegan"] == true && !meal.isVegan) {
          return false;
        }
        if (filters["Vegetarian"] == true && !meal.isVegetarian) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              titleMedium: const TextStyle(
                  fontSize: 24,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (context) => TabsScreen(favoriteMeal),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(filters, setFilters),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("meal App"),
        ),
        body: null);
  }
}
