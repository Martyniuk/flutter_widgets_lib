// Core
import 'package:flutter/material.dart';

// Library of widgets I play with
// import 'library/library.dart';
// Basic dummy layouts
import 'practice/basic/bankscreen.dart';
// import 'practice/basic/lampshop.dart';
import 'practice/basic/travelapp.dart';
import 'practice/basic/darkTravel.dart';
import 'practice/basic/productRelease.dart';
import 'practice/basic/smartHome.dart';
import 'practice/basic/restaurant.dart';
import 'practice/basic/travelApp2.dart';
import 'practice/basic/story_app.dart';
import 'practice/basic/onboarding_screens.dart';
import 'practice/basic/bicycle_app.dart';

// Advanced layouts
import 'practice/medium/travel_ui/travel_ui.dart';
import 'practice/medium/save_animals/save_animals.dart';
import 'practice/medium/tattoo/tattoo_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _drawDrawer() {
      return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Save Animals'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SaveAnimals(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bicycle App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BicycleApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Onboarding App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreens(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Story App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoryApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Travel App - 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Travel2App(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Restourant'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Smart House'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SmartHomeApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Travel Dark Theme'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DarkTravelApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Product Release'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductReleaseApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Travel App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TravelApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Bank App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BankScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('TravelUI App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TravelUIApp(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Tattoo Studio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TattooStudio(),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer: _drawDrawer(),
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 130,
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.pink,
                ),
              ),
              child: CustomPaint(
                painter: PathPainter(),
              ),
            ),
            Container(
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.green,
                ),
              ),
              child: CustomPaint(
                painter: PathPainter_2(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Path path = Path();

    path.moveTo(size.width, size.height);

    path.lineTo(40, size.height / 2 + 30);

    var controlP1 = Offset(5, size.height / 2);
    var endP1 = Offset(40, size.height / 2 - 30);

    path.quadraticBezierTo(controlP1.dx, controlP1.dy, endP1.dx, endP1.dy);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class PathPainter_2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    Path path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(30.0, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
