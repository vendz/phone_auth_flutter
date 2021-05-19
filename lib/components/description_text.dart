import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;

  DescriptionText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 32.0, left: 32.0, top: 32.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Open Sans SemiBold',
          color: Color(0xffb2b2b2),
        ),
      ),
    );
  }
}
