import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pili_variety_classification/decription/lanuza.dart';
import 'package:pili_variety_classification/decription/laysa.dart';
import 'package:pili_variety_classification/decription/magayon.dart';
import 'package:pili_variety_classification/decription/magnaye.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/screens/home_screen.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_button.dart';

class ResultDescriptionScreen extends StatefulWidget {
  static const String id = "result_description_screen";
  const ResultDescriptionScreen({
    super.key,
    required this.filePath,
    required this.label,
    required this.confidence,
    this.input,
  });

  final File? filePath;
  final String? label;
  final double? confidence;
  final String? input;

  @override
  State<ResultDescriptionScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primarybgColor,
      body: SafeArea(
        child: Column(
          children: [
            (widget.label!.toLowerCase() == 'magnaye')
                ? MagnayeDescription(
                    width: width, widget: widget, input: widget.input!)
                : (widget.label!.toLowerCase() == 'magayon')
                    ? MagayonDescription(
                        width: width, widget: widget, input: widget.input!)
                    : (widget.label!.toLowerCase() == 'lanuza')
                        ? LanuzaDescription(
                            width: width, widget: widget, input: widget.input!)
                        : (widget.label!.toLowerCase() == 'laysa')
                            ? LaysaDescription(
                                width: width,
                                widget: widget,
                                input: widget.input!)
                            : (widget.label!.toLowerCase() == 'mayon#1')
                                ? MagayonDescription(
                                    width: width,
                                    widget: widget,
                                    input: widget.input!)
                                : Container(),
            Container(
              height: height * 0.2,
              width: width,
              decoration: const BoxDecoration(
                color: primarybgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    title: "Retry",
                    onPress: (widget.input == 'MPF')
                        ? () => Navigator.pushNamed(context, MPFScreen.id)
                        : () => Navigator.pushNamed(context, RPSScreen.id),
                    fontSize: 16,
                    horizontalPadding: 128,
                    verticalPadding: 15,
                    bgColor: primaryColor,
                  ),
                  const SizedBox(height: 15),
                  AppButton(
                    title: "Home",
                    onPress: () => Navigator.pushNamed(context, HomeScreen.id),
                    fontSize: 16,
                    horizontalPadding: 124,
                    verticalPadding: 15,
                    bgColor: primarybgColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
