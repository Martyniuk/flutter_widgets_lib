//Core
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function callback;

  Answer({this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      child: RaisedButton(
        color: Colors.lightBlueAccent,
        child: Text(text, style: TextStyle(color: Colors.white)),
        onPressed: callback,
      ),
    );
  }
}
