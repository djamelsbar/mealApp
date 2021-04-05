import 'package:flutter/material.dart';
import 'package:mealapp/models/favorites_screen.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/category_screen.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals ;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page;

  @override
  void initState(){
    _page = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  int selectPageIndex = 0;
  void _selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[selectPageIndex]['title']),
      ),
      body: _page[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
