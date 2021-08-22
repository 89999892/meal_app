import 'package:flutter/material.dart';
import 'package:training1/dummy_data.dart.dart';
import 'package:training1/module/meal.dart';
import 'package:training1/widgets/meal_item.dart';
//contains meals in selected category
class categoryMealsScreen extends StatelessWidget {
  final List<Meal> _availablemeals;

  const categoryMealsScreen(this._availablemeals) ;

  @override
  Widget build(BuildContext context) {
    final routarg =ModalRoute.of(context).settings.arguments as Map <String,String>;
    final categoryid=routarg['id'];
    final categorytitle=routarg['title'];
    final categoryMeals = _availablemeals.where((meal) => meal.categories.contains(categoryid)).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(routarg['title']),
      ),
      body:ListView.builder(
          itemBuilder:(context,index){
            return  MealItem(imageurl: categoryMeals[index].imageUrl, id: categoryMeals[index].id, title: categoryMeals[index].title, duration:categoryMeals[index].duration ,complexity: categoryMeals[index].complexity, affordability: categoryMeals[index].affordability)
            ;
          },
        itemCount: categoryMeals.length,

      )
    );
  }
}
