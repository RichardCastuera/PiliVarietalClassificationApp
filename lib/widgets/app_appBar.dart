import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/home_screen.dart';

AppBar appBar({
  required BuildContext context,
  required String label,
  required Color bgColor,
  required Color fontColor,
  required bool origPressFunction,
}) {
  return AppBar(
    title: Text(label),
    titleTextStyle: TextStyle(
      color: fontColor,
      fontFamily: 'ProximaNova',
      fontSize: 20,
    ),
    backgroundColor: bgColor,
    foregroundColor: fontColor,
    leading: !origPressFunction
        ? IconButton(
            onPressed: () {
              // Navigate to HomeScreen when IconButton is pressed
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded))
        : IconButton(
            onPressed: () {
              // Navigate to HomeScreen when IconButton is pressed
              Navigator.pushNamed(context, HomeScreen.id);
            },
            icon: const Icon(Icons.arrow_back_rounded),
          ),
  );
}
