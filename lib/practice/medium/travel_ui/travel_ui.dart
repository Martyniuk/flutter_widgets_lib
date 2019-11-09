// https://dribbble.com/shots/6510521-Travel-App-for-booking-unique-experience/attachments

// Core
import 'package:flutter/material.dart';

// screens
import 'screens/home_screen.dart';

class TravelUIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: HomeScreen(),
    );
  }
}
