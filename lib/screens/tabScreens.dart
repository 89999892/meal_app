import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:training1/module/meal.dart';
import 'package:training1/screens/category_screen.dart';
import 'package:training1/screens/favoraties.dart';
import 'package:training1/widgets/MealDrawer.dart';
class TabScreen extends StatefulWidget {
  final List<Meal> _favoratesMeals;
  TabScreen(this._favoratesMeals);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String,Object>> _pages;

int _selectedIndex=0;
@override
  void initState() {
    // TODO: implement initState
  _pages =[
    {
      'page':CategoryScreen(),
      'title':'Categories',
    },{
      'page':favoratesScreen(widget._favoratesMeals),
      'title':'Favorates',
    }
  ];
    super.initState();
  }
void _selectedpage(int value){
  setState(() {
    _selectedIndex=value;
  });
  print(value);
}
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,),

      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.yellow,
        iconSize: 30,
            mouseCursor: MouseCursor.defer ,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'favorates'),
        ],
        
      ),
      drawer: MealDrawer(),
    );
  }
}
