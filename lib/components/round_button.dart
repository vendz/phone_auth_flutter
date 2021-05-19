import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double rightMargin;
  final double leftMargin;
  final double topMargin;
  final Function onPressed;
  final String text;

  RoundButton(
      {@required this.text,
      @required this.onPressed,
      this.leftMargin,
      this.rightMargin,
      this.topMargin});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: Color(0xff6177FC),
          ),
          width: double.infinity,
          margin: EdgeInsets.only(
              right: rightMargin, left: leftMargin, top: topMargin),
          padding: EdgeInsets.all(12),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Open Sans Bold',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
