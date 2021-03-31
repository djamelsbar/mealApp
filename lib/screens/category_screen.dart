import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final categories = DUMMY_CATEGORIES;
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: [
        ...categories.map((e) => CategoryItem(e))
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
