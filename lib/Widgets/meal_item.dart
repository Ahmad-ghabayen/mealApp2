import 'package:flutter/material.dart';
import 'package:mealapp2/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id ;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

   MealItem({
     required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  });

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,
    arguments: id).then((result) {
      if(result!=null ){
        removeItem(result);
      }
    } );
  }

  String get complexityText{
     switch(complexity){
      case Complexity.Simple: return 'Simple'; break;
       case Complexity.Challenging: return 'Challenge' ; break;
       case Complexity.Hard: return 'Hard' ; break;
       default : return 'Unknown' ; break;
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return 'Affordable'; break;
      case Affordability.Luxurious: return 'Luxurious' ; break;
      case Affordability.Pricey: return 'Pricey' ; break;
      default : return 'Unknown' ; break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text("$duration min"),
                    const SizedBox(width: 5),
                    const Icon(Icons.schedule),

                  ],
                ),
                Row(
                  children: [
                    Text(complexityText),
                    const SizedBox(width: 5),
                    const Icon(Icons.work),

                  ],
                ),
                Row(
                  children: [
                    Text(affordabilityText),
                    const SizedBox(width: 5),
                    const Icon(Icons.attach_money),

                  ],
                ),

              ],
            ),)
          ],
        ),
      ),
    );
  }
}
