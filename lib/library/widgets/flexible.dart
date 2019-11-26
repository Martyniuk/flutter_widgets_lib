import 'package:flutter/material.dart';

class FlexibleCustom extends StatefulWidget {
  @override
  FlexibleCustomState createState() => FlexibleCustomState();
}

/* Below from documentation ---> Flexible has FlexFit.loose by default
  const Flexible({
    Key key,
    this.flex = 1,
    this.fit = FlexFit.loose,
    @required Widget child,
  }) : super(key: key, child: child);

 */

class FlexibleCustomState extends State<FlexibleCustom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500.0,
        width: 350.0,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Flexible playfround'),
            ),
            Divider(color: Colors.black),
            Flexible(
              flex: 1,
              child: Container(
                width: 100.0,
                color: Colors.blue,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: Container(
                width: 200.0,
                color: Colors.grey,
              ),
            ),
            Container(
              width: 100.0,
              height: 400.0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
