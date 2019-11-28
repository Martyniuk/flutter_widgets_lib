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
      height: MediaQuery.of(context).size.height,
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
            children: <Widget>[],
          )
        ],
      ),
    );
  }
}
