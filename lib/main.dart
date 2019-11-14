// Core
import 'package:flutter/material.dart';

// Library of widgets I play with
// import 'library/library.dart';
// Basic dummy layouts
// import 'practice/basic/bankscreen.dart';
// import 'practice/basic/lampshop.dart';
// import 'practice/basic/travelapp.dart';
// import 'practice/basic/darkTravel.dart';
// import 'practice/basic/productRelease.dart';
// import 'practice/basic/smartHome.dart';
// import 'practice/basic/restaurant.dart';
// import 'practice/basic/travelApp2.dart';
import 'practice/basic/story_app.dart';

// Advanced layouts
import 'practice/medium/travel_ui/travel_ui.dart';

Future<Widget> buildPageAsync() async {
  return Future.microtask(() {
    return TravelUIApp();
  });
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoryApp(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  void _navigateToTravelUi(BuildContext context) async {
    var page = await buildPageAsync();
    var route = MaterialPageRoute(builder: (_) => page);

    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ola')),
      body: RaisedButton(
        onPressed: () {
          _navigateToTravelUi(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => TravelUIApp(),
          //   ),
          // );
        },
        child: Text('Traver UI'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: ButtonBar(
                children: <Widget>[],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('App 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('App 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
