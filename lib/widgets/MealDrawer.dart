import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';
class MealDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.2,
            width: double.infinity,
            padding: EdgeInsets.all(25),
            alignment: Alignment.centerLeft,
            color: Colors.yellow,
            child: Text('cooking up !',style: TextStyle(fontSize: 35,color: Colors.orange[900],fontWeight: FontWeight.w600),),
            
          ),
          ListTile(
            leading:Icon(Icons.restaurant,size: 24,) ,
            title:Text('Meal',style: TextStyle(fontSize: 23),) ,
            onTap: ()=>Navigator.of(context).pushReplacementNamed('/b'),
          ),
          ListTile(
            leading:Icon(Icons.settings,size: 24,) ,
            title:Text('Filters',style: TextStyle(fontSize: 23),) ,
            onTap: ()=>Navigator.of(context).pushReplacementNamed(filtersScreen.routename),
          ),
        ],
      ),
    );
  }
}
