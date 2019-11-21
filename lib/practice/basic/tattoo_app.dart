import 'package:flutter/material.dart';

class TattooStudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: OnboardingImageClipper(),
            child: Container(
              width: double.infinity,
              height: 650,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: -410,
                    top: -250,
                    bottom: 0.0,
                    child: Image.asset(
                      'assets/images/tattoo_app/img1.png',
                      fit: BoxFit.cover,
                      width: 950,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFE2B0FF).withOpacity(.8),
                            Color(0xFF9F44D3).withOpacity(.05),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115.0,
                    right: 70.0,
                    child: Text(
                      'NXT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 153.0,
                    right: 61.7,
                    child: Text(
                      'LVL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tattoo',
                        style: TextStyle(
                          fontSize: 33,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      TextSpan(
                        text: ' Studio',
                        style: TextStyle(
                          fontSize: 33,
                          color: Color(0xFF4A4A4A),
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              OnboardingButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OnboardingButtonClipper(),
      child: Container(
        width: 135,
        height: 175,
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
            onPressed: () {},
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

    var controlP1 = Offset(5, size.height / 2);
    var endP1 = Offset(40, size.height / 2 - 30);

    path.quadraticBezierTo(controlP1.dx, controlP1.dy, endP1.dx, endP1.dy);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class OnboardingImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(12, size.height - 38, 40, size.height - 48);
    path.lineTo(size.width - 40, size.height - 140);
    path.quadraticBezierTo(
        size.width, size.height - 145, size.width, size.height - 212);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
