import 'package:flutter/material.dart';
import 'package:pili_variety_classification/screens/MPF_screen.dart';
import 'package:pili_variety_classification/screens/RPS_screen.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_appBar.dart';
import 'package:pili_variety_classification/widgets/app_banner.dart';
import 'package:pili_variety_classification/widgets/app_button.dart';
import 'package:pili_variety_classification/widgets/circle_avatar.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(
          label: "",
          bgColor: primaryColor,
          fontColor: primaryColor,
          context: context,
          origPressFunction: true),
      backgroundColor: primarybgColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBanner(height: height),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.15),
                child: Column(
                  children: [
                    const Text(
                      "Choose what you want to identfy:",
                      style: TextStyle(
                        color: white,
                        fontFamily: 'ProximaNova',
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButton(
                              title: "Mature Pili Fruit",
                              onPress: () =>
                                  Navigator.pushNamed(context, MPFScreen.id),
                              fontSize: 20,
                              horizontalPadding: 90,
                              verticalPadding: 15,
                              bgColor: primaryColor,
                            ),
                            const SizedBox(height: 10),
                            AppButton(
                              title: "Raw Pili in the Shell",
                              onPress: () =>
                                  Navigator.pushNamed(context, RPSScreen.id),
                              fontSize: 20,
                              horizontalPadding: 73,
                              verticalPadding: 15,
                              bgColor: primaryColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          AppCircleAvatar(
            height: height,
            width: width,
            assetImage: 'assets/imgs/logo.png',
            title: 'Pili Variety Classification',
            leftPositionMultiplier: 0.18,
          )
        ],
      ),
    ));
  }
}
