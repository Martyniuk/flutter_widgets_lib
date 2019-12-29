// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/bullet.dart';

// Apps for Basic layout practice

import '../practice/basic/bankscreen.dart';
import '../practice/basic/travelapp.dart';
import '../practice/basic/darkTravel.dart';
import '../practice/basic/productRelease.dart';
import '../practice/basic/smartHome.dart';
import '../practice/basic/restaurant.dart';
import '../practice/basic/travelApp2.dart';
import '../practice/basic/story_app.dart';
import '../practice/basic/onboarding_screens.dart';
import '../practice/basic/login_app.dart';
import '../practice/basic/streaming_app.dart';
import '../practice/basic/notes_app.dart';
import '../practice/basic/menu_options.dart';
import '../practice/basic/onboarding_screens2.dart';
import '../practice/basic/bicycle_app.dart';
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
  },
  {
    'appLayout': BicycleApp(),
    'title': 'Bicycle Layout app',
    'details': [
      'Not responsive',
      'LayoutBuilder constrains example && Stack',
      'Hero example',
    ],
  },
  {
    'appLayout': OnboardingScreens2App(),
    'title': 'Onboarding_1 Layout app',
    'details': [
      'PageController && PageView',
      'AnimatedContainer ',
      'AnnotatedRegion<SystemUiOverlayStyle> for StatusBar',
    ],
  },
  {
    'appLayout': NotesApp(),
    'title': 'Notes Layout app',
    'details': [
      'Layout with state',
      'ListView',
      'TabBar with tabController',
    ],
  },
  {
    'appLayout': StreamingApp(),
    'title': 'Streaming Layout app',
    'details': [
      'Layout with state',
      'BottomNavigationBar - title: SizedBox.shrink()',
      'Stack with Positioned',
      'Custom Icons',
      'Custom Clipper'
    ],
  },
  {
    'appLayout': LoginApp(),
    'title': 'Login Layout app',
    'details': [
      'State',
      'Flutter Screen Util <- pug get <- some kind of responsibility',
      'LinearGradient',
      'RawMaterialButton'
    ],
  },
  {
    'appLayout': OnboardingScreens(),
    'title': 'Onboarding(Welcome)_2 Layout app',
    'details': [
      'PageController',
      'AnimationController && Tween && AnimatedBuilder',
    ],
  },
  {
    'appLayout': StoryApp(),
    'title': 'Story Layout app',
    'details': [
      'Interesting example of horizontal scrolling',
      'Aspect ration calculation && AspectRatio',
      'Positioned.fill && Positioned.directional',
      'LayoutBuilder with constrains usage',
    ],
  },
  {
    'appLayout': Travel2App(),
    'title': 'Travel_2 Layout app',
    'details': [
      'TabBar with TabController, tabs && TabBarView',
      'Nested Expanded widget implementation aka Grid view',
    ],
  },
  {
    'appLayout': RestaurantApp(),
    'title': 'Restaurant Layout app',
    'details': [
      'MaterialApp inside',
      'AppBar with actions, leading',
      'FloatingActionButton && FloatingActionButtonLocation.centerDocked',
      'Usage of Polygon from clippy_flutter - package with different shapes',
    ],
  },
  {
    'appLayout': SmartHomeApp(),
    'title': 'SmartHome Layout app',
    'details': [
      'Expanded with GridView',
      'AppBar with actions, leading',
      'FloatingActionButton && FloatingActionButtonLocation.centerDocked',
      'Usage of Polygon from clippy_flutter - package with different shapes',
    ],
  },
  {
    'appLayout': ProductReleaseApp(),
    'title': 'ProductRelease Layout app',
    'details': [
      'Scaffold with bottomNavigationBar(shape: CircularNotchedRectangle)',
      'FloatingActionButton && FloatingActionButtonLocation.centerDocked',
      'Usage of Arc from clippy_flutter - package with different shapes',
    ],
  },
  {
    'appLayout': DarkTravelApp(),
    'title': 'DarkTravel Layout app',
    'details': [
      'SafeArea usage',
      'TextField - Input Decoration',
      'Carousel slider package usage',
    ],
  },
  {
    'appLayout': TravelApp(),
    'title': 'Travel Layout app',
    'details': [
      'Nested Expanded layout',
      'Stack',
    ],
  },
  {
    'appLayout': BankScreen(),
    'title': 'Bank Layout app',
    'details': [
      'Date usage',
      'ListTile',
    ],
  },
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
