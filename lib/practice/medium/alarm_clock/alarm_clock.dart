// Core
import 'package:flutter/material.dart';

// Screen
import './screens/home_screen.dart';
import 'screens/add_alarm_screen.dart';

class AlarmApp extends StatefulWidget {
  @override
  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/add-alarm': (context) => AddAlarm(),
      },
      theme: ThemeData(
        primaryColor: Color(0xff1b2c57),
        accentColor: Color(0xff65d1ba),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
