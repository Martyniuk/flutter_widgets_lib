// Core
import 'package:flutter/material.dart';

// widgets
import '../widgets/onboarding_image_clipper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: OnboardingImageClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0.0,
                    left: -10.0,
                    bottom: -110.0,
                    right: 0.0,
                    child: Image.asset(
                      'assets/images/tattoo_app/login.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 211, 145, 1.0),
                            Color.fromRGBO(219, 0, 255, 0.01)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
