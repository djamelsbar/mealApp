import 'package:flutter/material.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFiltersData;

  const FiltersScreen(this.setFiltersData);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget buildListTile(
    bool switchW, String title, String subtitle, Function updateSwitch) {
    return SwitchListTile(
      title: Text(title),
      value: switchW,
      subtitle: Text(subtitle),
      onChanged: updateSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filtters"),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setFiltersData(selectedFilters);
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection.",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildListTile(
                  _glutenFree, "Gluten-Free", "Only include gluten-free meals",
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              buildListTile(_lactoseFree, "Lactose-Free",
                  "Only include lactose-free meals", (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
              buildListTile(
                  _vegan, "Vegan-Free", "Only include Vegan-free meals",
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              buildListTile(_vegetarian, "Vegetarian-Free",
                  "Only include vegetarian-free meals", (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
            ],
          ),
        ),
      ]),
      drawer: MainDrawer(),
    );
  }
}
