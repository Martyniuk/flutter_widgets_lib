// Core
import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Card Playground'),
            ),
            Divider(
              color: Colors.black,
              height: 2.0,
            ),
            Container(
              height: 100.0,
              width: 200.0,
              child: Card(
                child: Text('lol'),
              ),
            ),
            Container(
              height: 200.0,
              width: 150.0,
              child: Card(
                margin: EdgeInsets.all(20.0),
                clipBehavior: Clip.none,
                semanticContainer: false, // - ?
                color: Colors.orangeAccent,
                borderOnForeground: true, // - ?
                shape: CircleBorder(),
                elevation: 10.0,
                child: Text('lol2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
