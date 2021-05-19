import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  final Color color;

  TitleText({@required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Open Sans Bold',
          fontWeight: FontWeight.bold,
          color: this.color == null ? Color(0xff6177FC) : color,
        ),
      ),
    );
  }
}
