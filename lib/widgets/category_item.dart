import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final category;
  CategoryItem(this.category);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'category': category});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline1,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return category.color;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: category.color)))),
      onPressed: () => selectCategory(context),
    );
  }
}
