import 'package:flutter/material.dart';
import 'package:mealapp2/Widgets/category_item.dart';

import '../dummy_data.dart';

class categoryScreen extends StatelessWidget {
  const categoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: dummyCategories.map((catDate) => CategoryItem(catDate.id, catDate.title, catDate.color) ).toList()),
    );
  }
}
