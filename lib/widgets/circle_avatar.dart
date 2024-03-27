import 'package:flutter/material.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    required this.height,
    required this.width,
    required this.assetImage,
    required this.title,
    required this.leftPositionMultiplier,
    required this.isHomeScreen,
  });

  final double height;
  final double width;
  final double leftPositionMultiplier;
  final String assetImage;
  final String title;
  final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: isHomeScreen ? height * 0.23 : height * 0.17,
      left: width * leftPositionMultiplier,
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(150),
            ),
            child: Image(
              image: AssetImage(assetImage),
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: white,
              fontFamily: 'ProximaNova',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
