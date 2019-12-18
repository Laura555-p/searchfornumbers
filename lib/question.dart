import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    var assetImage = AssetImage('assets/images/image4.png');
    var image = Image(
      image: assetImage,
      width: 120.0,
      height: 120.0,
    );

    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, top: 40, right: 10, bottom: 5),
            child: image,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 20),
            child: Text(
              questionText,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.pinkAccent),
              textAlign: TextAlign.center,
            ),
          ),
        ],
    );
  }
}
