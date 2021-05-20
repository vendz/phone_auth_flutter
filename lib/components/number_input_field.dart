import 'package:flutter/material.dart';

class NumberInput extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final TextEditingController controller;

  NumberInput(
      {@required this.hintText, @required this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.phone,
      controller: controller != null ? controller : null,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Color(0xff999999),
            fontSize: 16,
            fontFamily: 'Open Sans SemiBold'),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
