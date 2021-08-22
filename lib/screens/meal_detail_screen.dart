import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training1/dummy_data.dart.dart';
import 'package:training1/module/meal.dart';
//contains details of selected meals
class MealDetailScreen extends StatelessWidget {
  static const routename='meal_detail';
 final Function _toggleFavorates;
 final Function _isfavoratemeal;

  const MealDetailScreen( this._toggleFavorates,this._isfavoratemeal) ;
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    final ingadientcolor=Theme.of(context).accentColor;
    final stepscolor=Theme.of(context).backgroundColor;


    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body:SingleChildScrollView(
        child: Column(

          children: [
            Container(
             // margin: EdgeInsets.symmetric(horizontal: 10),
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
            SectionType(context,'Ingredients',selectedMeal,selectedMeal.ingredients,ingadientcolor,150),
            SectionType(context,'steps' ,selectedMeal, selectedMeal.steps,stepscolor,210)


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isfavoratemeal(mealId)?Icons.star:Icons.star_border
        ),
        onPressed: (){
          _toggleFavorates(mealId);
        },
      ),
    );
  }

 Widget SectionType(BuildContext ctx,String text,Meal selectedMeal,List instructions,Color color,double height) {

    return  Column(children: [ Container(
      padding: EdgeInsets.symmetric(vertical: 15 ),
      child: Text(text,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
    ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 30),
        height: height,
        width: 500,

        decoration: BoxDecoration(
            boxShadow:[BoxShadow(color:Colors.black ,blurRadius: 2),] ,
            color: Theme.of(ctx).backgroundColor,
            border: Border.all(color: Colors.black  ),
            borderRadius: BorderRadius.circular(12)
        ),

        child: ListView.builder(
          itemBuilder:(ctx,index)=>Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            color:color ,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text('${index+1}-  '+instructions[index],style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          ) ,

          itemCount:instructions.length
          ,),
      )],) ;
 }
}
