import 'package:flutter/material.dart';
import 'package:training1/module/meal.dart';
import 'package:training1/widgets/meal_item.dart';

class favoratesScreen extends StatelessWidget {
  final List<Meal> _favoratesMeals;

  const favoratesScreen(this._favoratesMeals);

  @override
  Widget build(BuildContext context) {
    if(_favoratesMeals.isEmpty){
      return Center(child: Text(
        'you have no favorates yet -start adding some!' ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
      ),) ;
    }
    else   {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
            imageurl: _favoratesMeals[index].imageUrl,
            id: _favoratesMeals[index].id,
            title: _favoratesMeals[index].title,
            duration: _favoratesMeals[index].duration,
            complexity: _favoratesMeals[index].complexity,
            affordability: _favoratesMeals[index].affordability);
      },
      itemCount: _favoratesMeals.length,
    )); }
  }
}
