import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final  category;
  CategoryItem(this.category);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              child: Text(
                category.title,
                style: TextStyle(fontSize: 20),
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
              onPressed: () {},
            );
  }
}