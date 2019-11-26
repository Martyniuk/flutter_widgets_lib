import 'package:flutter/material.dart';

class ExpandedCustom extends StatefulWidget {
  @override
  ExpandedState createState() => ExpandedState();
}

// it has only 2 props - > flex and child(required)
/* --- below is from Source Code! 
--=== > Expanded is the same as Flexible but with predefined FlexFix ti tight < ===--
class Expanded extends Flexible {
  /// Creates a widget that expands a child of a [Row], [Column], or [Flex]
  /// so that the child fills the available space along the flex widget's
  /// main axis.
  const Expanded({
    Key key,
    int flex = 1,
    @required Widget child,
  }) : super(key: key, flex: flex, fit: FlexFit.tight, child: child);
}
*/

class ExpandedState extends State<ExpandedCustom> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 600.0,
        width: 400.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Expanded Playground'),
            ),
            Divider(color: Colors.black),
            Expanded(
              // flex: 2,
              child: Container(
                width: 100.0,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                width: 200.0,
                color: Colors.amber,
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
