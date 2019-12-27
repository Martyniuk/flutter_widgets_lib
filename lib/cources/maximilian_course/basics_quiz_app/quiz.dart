// Core
import 'package:flutter/material.dart';

// Widgets
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    List<Widget> answers =
        (questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((Map<String, Object> answer) {
      return Answer(
        text: answer['text'],
        callback: () => answerQuestion(answer['score']),
      );
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...answers,
      ],
    );
  }
}
