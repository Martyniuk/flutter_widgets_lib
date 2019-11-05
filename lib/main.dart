// Core
import 'package:flutter/material.dart';
// Instruments
import 'library/library.dart';

import 'practice/basic/bankscreen.dart';
import 'practice/basic/lampshop.dart';
import 'practice/basic/travelapp.dart';
import 'practice/basic/darkTravel.dart';
import 'practice/basic/productRelease.dart';
import 'practice/basic/smartHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SmartHomeApp();
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: DarkTravelApp(),
    // );
  }
}
