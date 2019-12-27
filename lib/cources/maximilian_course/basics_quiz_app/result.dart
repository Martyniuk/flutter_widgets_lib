// Core
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetFunction;

  Result(this.score, this.resetFunction);

  String get resultPhrase {
    String resultText;

    if (score <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (score <= 12) {
      resultText = 'Pretty okay';
    } else {
      resultText = 'not OKay!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36.0,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            textColor: Colors.blueAccent,
            onPressed: resetFunction,
          ),
        ],
      ),
    );
  }
}
