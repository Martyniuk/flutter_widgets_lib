// Core
import 'package:flutter/material.dart';

class OnboardingImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    var controllPoint1 = Offset(12, size.height - 30);
    var endPoint1 = Offset(40, size.height - 40);
    path.quadraticBezierTo(
        controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy);

    path.lineTo(size.width - 40, size.height - 140);
    var controllPoint2 = Offset(size.width, size.height - 145);
    var endPoint2 = Offset(size.width, size.height - 212);
    path.quadraticBezierTo(
        controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
