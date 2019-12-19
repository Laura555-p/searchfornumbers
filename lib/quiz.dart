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
    return Container(
      height: 650,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
            child:
                Question(widget.questions[widget.questionIndex]['questioText']),
          )),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
            child: Container(
              height: 380,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: [
                  ...(widget.questions[widget.questionIndex]['answers']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return FadeTransition(
                      opacity: _opacity,
                      child: Container(
                        child: Answer(
                            () => widget.answerQuestion(answer['score']),
                            answer['text']),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
