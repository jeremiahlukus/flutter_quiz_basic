import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _questions = [
    {
      'questionText': 'whats your fave color?',
      'answers': [
        {'text': 'black', 'score': 0},
        {'text': 'red', 'score': 4},
        {'text': 'blue', 'score': 2},
        {'text': 'green', 'score': 5}
      ]
    },
    {
      'questionText': 'whats your fave animal?',
      'answers': [
        {'text': 'dog', 'score': 0},
        {'text': 'cat', 'score': 4},
        {'text': 'unicorn', 'score': 2},
        {'text': 'bird', 'score': 5}
      ]
    },
    {
      'questionText': 'whats your fave cereal ?',
      'answers': [
        {'text': 'cheerios', 'score': 0},
        {'text': 'toast crunch', 'score': 4},
        {'text': 'lucky charms', 'score': 2},
        {'text': 'flakes', 'score': 5}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _total_score = 0;
    });
  }

  var _total_score = 0;
  void _answerQuestion(int score) {
    _total_score += score;
    if (_questionIndex < _questions.length) {
      setState(() {
        _questionIndex += 1;
      });
    } else {
      _questionIndex = 0;
      print("out of bounds");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Some text"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_total_score, _resetQuiz),
      ),
    );
  }
}
