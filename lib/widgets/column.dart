import 'package:flutter/material.dart';

class ColumnCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Hello Second text from cColumn'),
        Text('Aloha from Column'),
        Expanded(
          child: FittedBox(
            fit: BoxFit.none,
            child: FlutterLogo(),
          ),
        ),
      ],
    );
  }
}
