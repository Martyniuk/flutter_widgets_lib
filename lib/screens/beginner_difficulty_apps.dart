// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/bullet.dart';

// Apps for Basic layout practice

// import 'practice/basic/bankscreen.dart';
// import 'practice/basic/lampshop.dart';
// import 'practice/basic/travelapp.dart';
// import 'practice/basic/darkTravel.dart';
// import 'practice/basic/productRelease.dart';
// import 'practice/basic/smartHome.dart';
// import 'practice/basic/restaurant.dart';
// import 'practice/basic/travelApp2.dart';
// import 'practice/basic/story_app.dart';
// import 'practice/basic/onboarding_screens.dart';
// import 'practice/basic/login_app.dart';
// import 'practice/basic/streaming_app.dart';
// import 'practice/basic/notes_app.dart';
import '../practice/basic/menu_options.dart';
// import 'practice/basic/onboarding_screens2.dart';
// import 'practice/basic/bicycle_app.dart';
import '../practice/basic/adidas_app.dart';

var data = [
  {
    'appLayout': MenuOptions(),
    'title': 'Menu Options Layout app',
    'details': ['List Tile', 'Positioning'],
  },
  {
    'appLayout': AdidasApp(),
    'title': 'Adidas Layout app',
    'details': [
      'AppBar practice',
      'ListView implementation',
      'ScreenAwareSize function - plain responsive approach',
      'Stack & Positioned examples(overflow & negative values)',
      'Expand Large text example',
      'Flexible examples',
      'Custom clipper implemented'
    ],
  }
];

class BeginnerDifficultyApps extends StatelessWidget {
  static String routeName = '/beginner_difficulty_apps';

  Widget dataCard(BuildContext context, String title, List<String> details,
      Widget appLayout) {
    List<Widget> description = details.map((String information) {
      return ListTile(
        leading: Bullet(),
        title: Text(information),
      );
    }).toList();

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => appLayout),
        );
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              offset: Offset(0.0, 10.0),
              color: Colors.black38,
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Text(title),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              height: 2.0,
              color: Colors.blueGrey,
            ),
            Column(
              children: description,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = data.map((item) {
      return dataCard(
          context, item['title'], item['details'], item['appLayout']);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Beginner Difficulty Apps'),
      ),
      body: Container(
        child: ListView(
          children: cards,
        ),
      ),
    );
  }
}
