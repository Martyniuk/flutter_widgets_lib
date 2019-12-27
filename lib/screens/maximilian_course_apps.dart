// Core
import 'package:flutter/material.dart';

// Widgets
import '../widgets/bullet.dart';

// Course
import '../cources/maximilian_course/basics_quiz_app/quiz_app.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maximilian Apps we build thru Course'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizApp()),
              );
            },
            child: quizAppCard(),
          ),
        ],
      ),
    );
  }
}
