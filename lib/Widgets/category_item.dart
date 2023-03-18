import 'package:flutter/material.dart';
import 'package:mealapp2/screens/category_meals_screen.dart';

class   CategoryItem extends StatelessWidget {
 final  String id ;
 final String titlel;
 final Color color;

   CategoryItem( this.id,this.titlel, this.color);

   void selectCategory(BuildContext ctx){
     Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
     arguments: {
       'id': id,
       'title': titlel
     });

}


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor:  Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color
            ]
          ),
          color: color,
          borderRadius: BorderRadius.circular(15),

        ),
        child: Text(titlel, style: Theme.of(context).textTheme.titleMedium,),
      ),
      
    );
  }
}
