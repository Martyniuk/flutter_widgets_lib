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
// import 'practice/basic/story_app.dart';
import 'practice/basic/onboarding_screens.dart';

// Advanced layouts
// import 'practice/medium/travel_ui/travel_ui.dart';
import 'practice/medium/save_animals/save_animals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SaveAnimals(),
    );
  }
}
