import 'package:flutter/material.dart';

AppBar appBar(
    {required String label, required Color bgColor, required Color fontColor}) {
  return AppBar(
    title: Text(label),
    titleTextStyle: TextStyle(
      color: fontColor,
      fontFamily: 'ProximaNova',
      fontSize: 20,
    ),
    backgroundColor: bgColor,
    foregroundColor: fontColor,
  );
}
