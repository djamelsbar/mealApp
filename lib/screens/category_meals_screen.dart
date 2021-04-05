import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Category category ;
  List<Meal> categoryMeals;
  @override
  void didChangeDependencies() {
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    category = routArgs['category'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    super.didChangeDependencies();
  } 

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
           );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
