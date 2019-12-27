// Core
import 'package:flutter/material.dart';

class TextControll extends StatelessWidget {
  final Function callback;

  TextControll({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(onPressed: callback, child: Text('Update text.')),
    );
  }
}
