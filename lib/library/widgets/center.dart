// Core
import 'package:flutter/material.dart';

class CenterCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text('Hello Centered Text'),
        ),
        Center(
          heightFactor: 5.0,
          widthFactor: 0.2,
          child: Container(
            // width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(
                  width: 1.0,
                  color: Colors.red,
                )),
          ),
        ),
        Container(
          // height: 100.0,
          width: 200.0,
          child: Center(
            child: Text('lol'),
          ),
        )
      ],
    );
  }
}
