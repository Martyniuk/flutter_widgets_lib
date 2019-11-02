// Core
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Instruments
import 'size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Learning Platform Application', home: Text('Hello'),
              // theme: <--- can be put here
              // home: WelcomeScreen(),
            );
          },
        );
      },
    );
  }
}
