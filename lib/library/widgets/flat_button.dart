// Core
import 'package:flutter/material.dart';

class FlatButtonCustom extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlatButtonState();
  }
}

// Handle changes to a text field --> Playaround
class _FlatButtonState extends State<FlatButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        border: Border.all(
          width: 4.0,
          color: Colors.red,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('Flat Button playground'),
          Divider(
            color: Colors.black,
            thickness: 3.0,
          ),
          Column(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                highlightColor: Colors.red,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Children 1'),
                    Text('Children 2'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
