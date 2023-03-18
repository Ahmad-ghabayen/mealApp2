import 'package:flutter/material.dart';
import 'package:mealapp2/Widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';
  final Function saveData;
  final Map<String,bool> currentFilter;

  FiltersScreen(this.currentFilter,this.saveData);


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

@override
  void initState() {
  isGlutenFree = widget.currentFilter['Gluten'] as bool ;
  isLactoseFree =  widget.currentFilter['Lactose'] as bool ;
  isVegan =  widget.currentFilter['Vegan'] as bool ;
  isVegetarian =  widget.currentFilter['Vegetarian'] as bool ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(onPressed: () {

            final selectedFilters= {
              "Gluten": isGlutenFree,
              "Lactose": isLactoseFree,
              "Vegan": isVegan,
              "Vegetarian": isVegetarian
            };
            widget.saveData(selectedFilters);
          }, icon: const Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text("Adjust Your Meal selection ",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium),
          ),
          Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                      title: const Text("Gluten-Free"),
                      subtitle: const Text("Only Include Gluten-Free Meals"),
                      value: isGlutenFree,
                      onChanged: (newValue) {
                        setState(() {
                          isGlutenFree = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: const Text("Lactose-Free"),
                      subtitle: const Text("Only Include Lactose-Free Meals"),
                      value: isLactoseFree,
                      onChanged: (newValue) {
                        setState(() {
                          isLactoseFree = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: const Text("Vegan"),
                      subtitle: const Text("Only Include Vegan Meals"),
                      value: isVegan,
                      onChanged: (newValue) {
                        setState(() {
                          isVegan = newValue;
                        });
                      }),
                  SwitchListTile(
                      title: const Text("Vegetarian"),
                      subtitle: const Text("Only Include Vegetarian Meals"),
                      value: isVegetarian,
                      onChanged: (newValue) {
                        setState(() {
                          isVegetarian = newValue;
                        });
                      }),
                ],
              ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }
}
