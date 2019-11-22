// Core
import 'package:flutter/material.dart';

// Screen
import '../screens/login_screen.dart';

class OnboardingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OnboardingButtonClipper(),
      child: Container(
        width: 135,
        height: 135,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF26567),
              Color(0xFF9F3CB2),
            ],
            stops: [0.5, 1.0],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class OnboardingButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, size.height);

    path.lineTo(40, size.height / 2 + 30);

    var controlPoint = Offset(5, size.height / 2);
    var endPoint = Offset(40, size.height / 2 - 30);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
