// Core
import 'package:flutter/material.dart';
// Instruments
import 'library/library.dart';
import 'practice/basic/bankscreen.dart';
import 'practice/basic/lampshop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lampshop(),
    );
  }
}
