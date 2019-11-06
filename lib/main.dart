// Core
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// Instruments
import 'library/library.dart';

import 'practice/basic/bankscreen.dart';
import 'practice/basic/lampshop.dart';
import 'practice/basic/travelapp.dart';
import 'practice/basic/darkTravel.dart';
import 'practice/basic/productRelease.dart';
import 'practice/basic/smartHome.dart';
import 'practice/basic/restaurant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RestaurantApp();
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: DarkTravelApp(),
    // );
  }
}
