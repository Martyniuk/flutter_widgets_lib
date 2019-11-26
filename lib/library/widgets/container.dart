import 'package:flutter/material.dart';

class ContainerCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Container: 
      1. We can pass height and width to Container
      2. alignment: <-- Align the child within the container
        - Alignment.bottomLeft
        - Alignment.bottomRight
        - Alignment.bottomCenter
        - Alignment.center
        - Alignment.centerRight
        - Alignment.centerLeft
        - Alignment.topCenter
        - Alignment.topLeft
        - Alignment.topRight

      3. constraints: <-- Additional constraints to apply to the child.
        - BoxConstrains(
          maxHeight: 300.0,
          maxWidth: 200.0,
          minWidth: 150.0,
          minHeight: 150.0
        )
        - BoxConstraints.expand
        - BoxConstraints.loose
        - BoxConstraints.tight
        - BoxConstraints.tightForFinite

      4. decoration:  <-- 

      5.foregroundDecoration: <--

      6. padding: <-- inner space to be given
        - EdgeInstets.all
        - EdgeInstets.only
        - EdgeInstets.symmetric:
          - horizontal
          - vertical
      7. margin    <-- outer space to be given
        - EdgeInstets.all
        - EdgeInstets.only
        - EdgeInstets.symmetric:
          - horizontal
          - vertical

      8, transform <-- Matrix4 <-- The transformation matrix to apply before painting the container.
        - Matrix4.rotationZ
        - Matrix4.rotationX
        - Matrix4.rotationY

        - documentation, but not easy https://api.flutter.dev/flutter/vector_math_64/Matrix4-class.html
    */
    return Container(
      height: 700.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5.0,
          color: Colors.black,
        ),
      ),
      child: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Container Playground'),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 3.0,
          ),
          Container(
            width: 100.0,
            height: 150.0,
            alignment: Alignment.center,
            child: Text('Container - alignment'),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - padding'),
          ),
          Container(
            width: 33.0,
            height: 52.0,
            alignment: Alignment.center,
            margin: EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - margin'),
          ),
          Container(
            height: 100.0,
            width: 150.0,
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(.3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - transform - Matrix4.rotationZ(double)'),
          ),
          SizedBox(height: 100.0),
          Container(
            height: 100.0,
            width: 150.0,
            alignment: Alignment.center,
            transform: Matrix4.rotationX(0.4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - transform - Matrix4.rotationX(double)'),
          ),
          Container(
            height: 100.0,
            width: 150.0,
            alignment: Alignment.center,
            transform: Matrix4.rotationY(0.6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - transform - Matrix4.rotationY(double)'),
          ),
          Container(
            height: 100.0,
            width: 150.0,
            alignment: Alignment.center,
            constraints: BoxConstraints.expand(width: 350.0, height: 400.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text(
                'Container - constrains - BoxConstraints.expand(width, height)'),
          ),
          Container(
            height: 100.0,
            width: 150.0,
            alignment: Alignment.center,
            constraints: BoxConstraints.loose(Size(400.0, 400.0)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Text('Container - constrains - BoxConstraints.loose(Size)'),
          ),
        ],
      ),
    );
  }
}
