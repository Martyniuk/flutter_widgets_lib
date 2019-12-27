// Core
import 'package:flutter/material.dart';
import 'dart:math';

// Widgets
import './text.dart';
import './text_control.dart';

class FirstAssignmentApp extends StatefulWidget {
  @override
  _FirstAssignmentAppState createState() => _FirstAssignmentAppState();
}

class _FirstAssignmentAppState extends State<FirstAssignmentApp> {
  String _text = 'Initial value';

  int generateRandomNumber() {
    Random r = Random();

    return r.nextInt(5);
  }

  void updateText() {
    int number = generateRandomNumber();

    if (number < 2) {
      setState(() {
        _text = 'lower than 2';
      });
    } else if (number < 4) {
      setState(() {
        _text = 'lower than 4';
      });
    } else {
      setState(() {
        _text = 'Lol Hz';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First Assignment')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextWidget(text: _text),
            TextControll(callback: updateText),
          ],
        ),
      ),
    );
  }
}
