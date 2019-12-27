// Core
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  TextWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 22.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
