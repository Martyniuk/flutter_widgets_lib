// Core
import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      alignment: Alignment.centerLeft,
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: Colors.black38,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
