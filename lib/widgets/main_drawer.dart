import 'package:flutter/material.dart';
import 'package:mealapp/screens/filtters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon,String text, Function function){
    return ListTile(
            leading: Icon(icon,size: 26),
            title: Text(text, style: TextStyle(
              fontSize:24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w700
            )),
            onTap: function,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!', style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor
            ),
          ),
          ),
          SizedBox(height: 20,),
          buildListTile(Icons.restaurant,"Meal",(){Navigator.of(context).pushReplacementNamed("/");}),
          buildListTile(Icons.settings,"Filter",(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}