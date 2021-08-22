import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training1/screens/meal_detail_screen.dart';
import '../module/meal.dart';
//contains the wideget item of the meals of selected category

class MealItem extends StatelessWidget {
  final String imageurl;
  final String id;
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  const MealItem(
      {
       @required   this.imageurl,
        @required  this.id,
        @required this.title,
        @required this.duration,
        @required this.complexity,
        @required this.affordability,
      });
  String get ComplixtyText{
    if(complexity==Complexity.Challenging)
      return 'Challenging';
    else if(complexity==Complexity.Simple)
      return 'Simple';
    else if (complexity==Complexity.Hard)
      return 'Hard';
    else
      return 'Unknown';
  }
  String get AffordabilityText{
    if(affordability==Affordability.Affordable)
      return 'Affordable';
    else if(affordability==Affordability.Luxurious)
      return 'Luxurious';
    else if (affordability==Affordability.Pricey)
      return 'Pricey';
    else
      return 'Unknown';
  }
  

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routename,arguments: id);
    
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> selectMeal(context),
      child: Card(
        elevation:10 ,
        margin: EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Image.network(imageurl,width: double.infinity,height: 200,fit: BoxFit.cover,),
                ),
                  Positioned(
                    bottom: 20,
                    right: 5,

                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(10),
                      color: Colors.black38,
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white,fontSize: 26),
                      ),
                    ),
                  ),

              ],
            ),
            Padding( 
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('$duration min',style: TextStyle(fontSize: 17),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text(ComplixtyText,style: TextStyle(fontSize: 17),)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text(AffordabilityText,style: TextStyle(fontSize: 17),)
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
