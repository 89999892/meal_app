import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/MealDrawer.dart';

class filtersScreen extends StatefulWidget {
  static const routename = 'filterroute';
  final bool vegan ;
 final bool vegetarian ;
 final bool lactoseFree ;
 final bool glutenFree ;
 final Function savefilters;
  const filtersScreen( this.vegan, this.vegetarian, this.lactoseFree, this.glutenFree, this.savefilters) ;
  @override
  _filtersScreenState createState() => _filtersScreenState(vegan,vegetarian,lactoseFree,glutenFree);
}

class _filtersScreenState extends State<filtersScreen> {
  bool _vegan ;
   bool _vegetarian ;
  bool _lactoseFree ;
  bool _glutenFree ;

  _filtersScreenState(this._vegan, this._vegetarian, this._lactoseFree, this._glutenFree);


  Widget buildSwitchTile(bool type, String title, String subTitle,
      Function action) {
   return SwitchListTile(
     activeColor:Colors.deepOrangeAccent ,


       value: type,
        title: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
        subtitle: Text(subTitle),
        onChanged: action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('your filters'),
        actions: [

          IconButton(icon: Icon(Icons.save), onPressed:(){
            final selectedfilters={
            'vegan':_vegan ,
            'vegetarian' :_vegetarian ,
            'lactoseFree' :_lactoseFree ,
            'glutenFree':_glutenFree ,
            };
            widget.savefilters(_vegan,_vegetarian,_lactoseFree,_glutenFree);
          }),
        ],
      ),

      body: Column(
          children: [
      Container(
      padding: EdgeInsets.all(20),
      child: Text('Adjust your meal selection',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),),
    ),
    Expanded(child: ListView(
    children: [
    buildSwitchTile(_glutenFree, 'Gluten-free', 'only include gluten free meals ', (newValue){
   setState(() {
     _glutenFree=newValue;
   });}
    ),
      buildSwitchTile(_lactoseFree, 'Lactose-Free', 'only include lactose Free meals ', (newValue){
       setState(() {
         _lactoseFree=newValue;
       });}
      ),
      buildSwitchTile(_vegan, 'Vegan', 'only include vegan meals ', (newValue){
       setState(() {
         _vegan=newValue;
       });}
      ),
      buildSwitchTile(_vegetarian, 'Vegetarian', 'only include vegetarian meals ', (newValue){
       setState(() {
         _vegetarian=newValue;
       });}
      ),

    ],
    ))

    ],
    ),
    drawer: MealDrawer(),
    );
    }
  }




