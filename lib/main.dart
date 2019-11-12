// Core
import 'package:flutter/material.dart';

// Library of widgets I play with
// import 'library/library.dart';
// Basic dummy layouts
// import 'practice/basic/bankscreen.dart';
// import 'practice/basic/lampshop.dart';
// import 'practice/basic/travelapp.dart';
// import 'practice/basic/darkTravel.dart';
// import 'practice/basic/productRelease.dart';
// import 'practice/basic/smartHome.dart';
// import 'practice/basic/restaurant.dart';
// import 'practice/basic/travelApp2.dart';

// Advanced layouts
import 'practice/medium/travel_ui/travel_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Title'),
        ),
        body: Text('Hello'),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
