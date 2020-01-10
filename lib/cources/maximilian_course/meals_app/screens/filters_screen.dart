// Core
import 'package:flutter/material.dart';
//Widgets
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters_screen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function onChangedHandler) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      onChanged: (bool value) {
        onChangedHandler(value);
      },
      value: currentValue,
    );
  }

  void _updateGlutenValue(bool value) {
    setState(() {
      _glutenFree = value;
    });
  }

  void _updateVegetarianValue(bool value) {
    setState(() {
      _vegetarian = value;
    });
  }

  void _updateVeganValue(bool value) {
    setState(() {
      _vegan = value;
    });
  }

  void _updateLactoseValue(bool value) {
    setState(() {
      _lactoseFree = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile(
                  'Gluten-free',
                  'Only includes gluten-free meals',
                  _glutenFree,
                  _updateGlutenValue,
                ),
                _buildSwitchTile(
                  'Vegeterian',
                  'Only includes vegeterian meals',
                  _vegetarian,
                  _updateVegetarianValue,
                ),
                _buildSwitchTile(
                  'Vegan',
                  'Only includes vegan meals',
                  _vegan,
                  _updateVeganValue,
                ),
                _buildSwitchTile(
                  'Lactose-free',
                  'Only includes Lactose-free meals',
                  _lactoseFree,
                  _updateLactoseValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
