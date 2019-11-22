// Core
import 'package:flutter/material.dart';

// Widgets
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_image_clipper.dart';

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
              height: MediaQuery.of(context).size.height * 0.8,
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
