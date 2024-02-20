// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    Key? key,
    required this.subTitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 24.0, vertical: 16.0),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF808080),
        ),
      ),
    );
  }
}