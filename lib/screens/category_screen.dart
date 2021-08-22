import 'package:flutter/material.dart';
import 'package:training1/dummy_data.dart.dart';
import 'package:training1/widgets/categoryitem.dart';


class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((CategoryData) =>CategoryItem(id: CategoryData.id, title: CategoryData.title) ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2.8,
          crossAxisSpacing: 30,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 30,
        ),
      ),
    );  }
}
