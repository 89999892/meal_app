import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:training1/screens/category_screen.dart';
import 'package:training1/screens/category_meals_screen.dart';
import 'page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',

      theme: ThemeData(
        appBarTheme:AppBarTheme(color: Colors.orange),
        primarySwatch: Colors.red,
        accentColor:Colors.pink ,
        canvasColor: Color.fromARGB(233, 233, 322, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromARGB(29, 50, 60, 1)),//
          body2: TextStyle(color: Color.fromARGB(59, 20, 10, 1)),
          title: TextStyle(fontSize: 20),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: pview(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return CategoryScreen();

  }


  }

