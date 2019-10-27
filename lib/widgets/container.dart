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
      3. constraints: <-- 

      4. decoration:  <-- 

      5.foregroundDecoration: <--

      6. padding: <-- inner space to be given
        - EdgeInstets.all
        - EdgeInstets.all
      7. margin    <-- outer space to be given
        - EdgeInstets.all
        - EdgeInstets.all

      8, transform <--
    */
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      children: <Widget>[
        Center(
          child: Text(
            'Below are Containers WIdgets to PLay with:',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: 200.0,
          height: 300.0,
          alignment: Alignment.center,
          child: Text('First Container'),
        )
      ],
    );
  }
}
