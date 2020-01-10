import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _tasks = const [
    {
      'taskText': 'Find me, I am number 10 !',
      'answers': [
        {'text': '10', 'score': 10},
        {'text': '13', 'score': 13},
        {'text': '14', 'score': 14},
        {'text': '17', 'score': 17},
        {'text': '16', 'score': 16},
        {'text': '18', 'score': 18},
        {'text': '17', 'score': 17},
        {'text': '16', 'score': 16},
        {'text': '18', 'score': 18}
      ],
    },
    {
      'taskText': 'Find me, I am number 40 !',
      'answers': [
        {'text': '42', 'score': 42},
        {'text': '44', 'score': 44},
        {'text': '40', 'score': 40},
        {'text': '41', 'score': 41},
        {'text': '45', 'score': 45},
        {'text': '49', 'score': 49},
        {'text': '41', 'score': 41},
        {'text': '45', 'score': 45},
        {'text': '49', 'score': 49}
      ]
    },
    {
      'taskText': 'Find me, I am waiting for you, number 124 !',
      'answers': [
        {'text': '142', 'score': 142},
        {'text': '128', 'score': 128},
        {'text': '123', 'score': 123},
        {'text': '124', 'score': 124},
        {'text': '182', 'score': 128},
        {'text': '122', 'value': 122},
        {'text': '124', 'score': 124},
        {'text': '182', 'score': 128},
        {'text': '122', 'value': 122}
      ]
    },
    {
      'taskText': 'Find me, I can\'t wait anymore, number 63!',
      'answers': [
        {'text': '36', 'score': 36},
        {'text': '66', 'score': 66},
        {'text': '61', 'score': 61},
        {'text': '62', 'score': 62},
        {'text': '63', 'score': 63},
        {'text': '68', 'score': 68},
        {'text': '62', 'score': 62},
        {'text': '63', 'score': 63},
        {'text': '68', 'score': 68}
      ]
    },
    {
      'taskText': 'Find me ASP, your number 32!',
      'answers': [
        {'text': '33', 'score': 33},
        {'text': '23', 'score': 23},
        {'text': '32', 'score': 32},
        {'text': '34', 'score': 34},
        {'text': '31', 'score': 31},
        {'text': '38', 'score': 38},
        {'text': '34', 'score': 34},
        {'text': '31', 'score': 31},
        {'text': '38', 'score': 38}
      ]
    },
  ];

  var _taskIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _taskIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerOfTask(int score) {
    _totalScore += score;
    setState(() {
      _taskIndex = _taskIndex + 1;
    });
    print(_taskIndex);
    if (_taskIndex < _tasks.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: _taskIndex <  _tasks.length
            ? Quiz(
          answerOfTask: _answerOfTask,
          taskIndex: _taskIndex,
          tasks: _tasks,
              )
            : Result(_resetQuiz, _totalScore),
      ),
    );
  }
}
