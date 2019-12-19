import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    var assetImage = AssetImage('assets/images/image4.png');
    var image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
          child: image,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
          child: Text(
            questionText,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green[200]),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
