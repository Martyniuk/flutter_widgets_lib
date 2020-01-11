// Core
import 'package:flutter/material.dart';
//Widgets
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters_screen';
  final Function setFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function onChangedHandler,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      onChanged: onChangedHandler,
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
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.setFilters(selectedFilters);
            },
          ),
        ],
      ),
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
