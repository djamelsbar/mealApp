import 'package:flutter/material.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import './screens/category_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        '/': (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Meal App")),
            body: CategoryScreen(),
          );
        },
        CategoryMealsScreen.routeName:(context)=>CategoryMealsScreen(),
      },
    );
  }
}
