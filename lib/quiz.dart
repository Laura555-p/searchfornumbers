import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  AnimationController _opacityController;
  Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _opacityController = new AnimationController(
        vsync: this, duration: const Duration(seconds: 5));
    _opacity =
        new CurvedAnimation(parent: _opacityController, curve: Curves.easeInOut)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _opacityController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _opacityController.forward();
            }
          });
    _opacityController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _opacityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(widget.questions[widget.questionIndex]['questioText']),
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return FadeTransition(
            opacity: _opacity,
            child: Container(
                child: Answer(() => widget.answerQuestion(answer['score']),
                    answer['text'])),
          );
        }).toList(),
      ],
    );
  }
}
