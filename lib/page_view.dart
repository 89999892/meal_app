import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training1/dummy_data.dart.dart';
import 'package:training1/module/meal.dart';
import 'package:training1/screens/category_meals_screen.dart';
import 'package:training1/screens/filter_screen.dart';
import 'package:training1/screens/tabScreens.dart';
import './screens/meal_detail_screen.dart';
import 'package:training1/screens/filter_screen.dart';
import 'main.dart';
class pageData {
  final String title;
  final String discribtion;
  final String imageUrl;
  final IconData dataicon;

  pageData(
      {@required this.title,
      @required this.discribtion,
      @required this.imageUrl,
      @required this.dataicon});
}

class pview extends StatefulWidget {


  @override
  _pviewState createState() => _pviewState();
}

class _pviewState extends State<pview> {
  final PageController _pageController = PageController(initialPage: 0);
   bool vegan=false ;
   bool vegetarian=false  ;
   bool lactoseFree =false ;
   bool glutenFree =false ;
   List<Meal> _availablemeals=DUMMY_MEALS;
  List<Meal> _favorates=[];
   //this func will pass to meal details screen to add or remove selected meal from favoraties screen
  void _togglefavoraties(String mealId){
   setState(() {
     final existingIndex=_favorates.indexWhere((meal) =>meal.id==mealId);
     if(existingIndex>=0){
       _favorates.removeAt(existingIndex);
     }else{
       _favorates.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
   }});}
  bool _isfavorateMeal(String mealId){
    return _favorates.any((meal) =>meal.id==mealId);
  }

  void savefilters(bool _vegan,bool _vegetarian,bool _lactoseFree,bool _glutenFree ){
   setState(() {
     vegan=_vegan;
     vegetarian=_vegetarian;
     lactoseFree=_lactoseFree;
     glutenFree=_glutenFree;
     _availablemeals=DUMMY_MEALS.where((meal){
       if(vegan&&!meal.isVegan){
         return false;
       }
       if(vegetarian&&!meal.isVegetarian){
         return false;
       }
       if(lactoseFree&&!meal.isLactoseFree){
         return false;
       }
       if(glutenFree&&!meal.isGlutenFree){
         return false;
       }
       return true;
     }
     ).toList();

   });
  }
  List<pageData> Mydata = [
    pageData(
        title: 'Hello!',
        discribtion: "welcome to meal app",
        imageUrl: "assets/images/meal1.jpg",
        dataicon: Icons.fastfood),
    pageData(
        title: 'great!',
        discribtion: "enjoy with delicious & different kinds of meals & learn its ingradients & steps",
        imageUrl: "assets/images/meal2.jpg",
        dataicon: Icons.restaurant),
    pageData(
        title: 'ok!',
        discribtion: "the app includes four kinds of filters ,you can choose what you want",
        imageUrl: "assets/images/meal3.jpg",
        dataicon: Icons.ramen_dining),
    pageData(
        title: 'great!',
        discribtion: "you can add your favorate meals & save them to favorates list ",
        imageUrl: "assets/images/meal4.jpg",
        dataicon: Icons.settings_applications)
  ];
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (currentIndex < 3) currentIndex++;
      _pageController.animateToPage(currentIndex,
          duration: Duration(seconds: 3), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        appBarTheme:AppBarTheme(color: Colors.orange),
        primarySwatch: Colors.orange,
        accentColor:Colors.orange[300] ,
       backgroundColor: Colors.orange[50],
       canvasColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
       //  body1: TextStyle(color: Color.fromARGB(29, 50, 60, 1)),//
          //body2: TextStyle(color: Color.fromARGB(59, 20, 10, 1)),
         // title: TextStyle(fontSize: 20),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
        routes: {
          // "/" :(context)=> pview(),
          "/b" :(context)=> TabScreen(_favorates),
          "/a" :(context)=>categoryMealsScreen(_availablemeals),
          MealDetailScreen.routename:(context)=>MealDetailScreen(_togglefavoraties,_isfavorateMeal),
          filtersScreen.routename:(context)=>filtersScreen(vegan, vegetarian, lactoseFree, glutenFree,savefilters),

        },
      home: Scaffold(
        body: Stack(
          children: [
            Builder(
              builder: (ctrx) => PageView(
                children: Mydata.map((item) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: ExactAssetImage(item.imageUrl),
                              fit: BoxFit.cover)),
                      child:

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item.dataicon,
                                size: 200,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 200,
                                width:380,
                                color: Colors.black38,
                                child: Column(
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(fontSize: 50, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      item.discribtion,
                                      style: TextStyle(fontSize: 30, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),
                    )).toList(),
                controller: _pageController,
                onPageChanged: (val) {
                  setState(() {
                    currentIndex = val;
                   /* if (currentIndex == 2) {
                      Future.delayed(Duration(seconds: 2),
                          () => Navigator.of(ctrx).pushNamed('/b'));
                    }*/
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment(0, 0.66),
              child: Indicator(currentIndex),
            ),
            Builder(
                builder: (ctox) => Align(
                      alignment: Alignment(0, .9),
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(ctox).pushNamed('/b');
                          },
                          color: Colors.deepOrangeAccent,
                          child: Text(
                            'Getstarted',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  int index;

  Indicator(this.index);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContainer(this.index == 0 ? Colors.red : Colors.blueGrey),
        buildContainer(this.index == 1 ? Colors.red : Colors.blueGrey),
        buildContainer(this.index == 2 ? Colors.red : Colors.blueGrey),
        buildContainer(this.index == 3 ? Colors.red : Colors.blueGrey),
      ],
    );
  }

  Container buildContainer(Color color) {
    return Container(
      height: 13,
      width: 13,
      margin: EdgeInsets.all(2.5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
