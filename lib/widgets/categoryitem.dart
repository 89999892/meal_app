import 'package:flutter/cupertino.dart';
import 'package:training1/main.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
import '../screens/category_screen.dart';
//contains shape of category widget
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    @required this.id,
    @required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) =>
          InkWell(
            onTap: () {
              Navigator.of(ctx).pushNamed('/a',
                  arguments:{
                'title':title,
                    'id':id,

                  }
              );
            },
            child: Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12, spreadRadius: 5, blurRadius: 5)
                ],

              ),
              child: Text(this.title, style: TextStyle(fontSize: 30),),

            ),
          ),
    );
  }
}
