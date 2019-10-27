// Core
import 'package:flutter/material.dart';
// Instruments
import 'library.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Library'),
        ),
        body: Library(),
      ),
    );
  }
}
