// Core
import 'package:flutter/material.dart';

// Widgets
import './result.dart';
import './quiz.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 1},
        {'text': 'Lion', 'score': 1}
      ],
    },
    {
      'questionText': 'Some random question?',
      'answers': [
        {'text': 'answer 1', 'score': 1},
        {'text': 'answer 2', 'score': 1},
        {'text': 'answer 3', 'score': 1},
        {'text': 'answer 4', 'score': 1}
      ],
    },
  ];
  int _question_index = 0;
  int _total_score = 0;

  void answerQuestion(int score) {
    _total_score += score;

    setState(() {
      _question_index++;
    });

    print(_question_index);
    print(_questions.length);
  }

  void _resetQuiz() {
    setState(() {
      _question_index = 0;
      _total_score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _question_index < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _question_index,
                answerQuestion: answerQuestion,
              )
            : Result(_total_score, _resetQuiz),
      ),
    );
  }
}
