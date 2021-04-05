import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/models/tabs_screen.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import 'package:mealapp/screens/filtters_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filter = _filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorites(String mealId){
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                headline1: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          primarySwatch: Colors.pink),
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routName: (context) =>
            MealDetailScreen(_toggleFavorite,_isMealFavorites),
        FiltersScreen.routeName: (context) => FiltersScreen(setFilters),
      },
    );
  }
}
