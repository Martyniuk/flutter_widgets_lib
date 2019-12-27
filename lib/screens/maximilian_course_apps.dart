// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/bullet.dart';

// Course
import '../cources/maximilian_course/basics_quiz_app/quiz_app.dart';
import '../cources/maximilian_course/first_assignment/first_assignment_main.dart';

var data = [
  {
    'appLayout': QuizApp(),
    'title': 'Quiz app',
    'details': ['List Tile', 'Positioning'],
  },
  {
    'appLayout': FirstAssignmentApp(),
    'title': 'First assignment',
    'details': [
      'State practice',
      'Widget separatation',
    ],
  }
];

class MaximilianCourseApps extends StatelessWidget {
  static String routeName = '/maximilian_course_apps';

  Widget quizAppCard() {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Quiz App'),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 2.0,
            color: Colors.blueGrey,
          ),
          ListTile(
            leading: Bullet(),
            title: Text('Dart Basics'),
          ),
          ListTile(
            leading: Bullet(),
            title: Text('Widgets Basics'),
          ),
        ],
      ),
    );
  }

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
        title: Text('Maximilian Apps we build thru Course'),
      ),
      body: Column(
        children: cards,
      ),
    );
  }
}
