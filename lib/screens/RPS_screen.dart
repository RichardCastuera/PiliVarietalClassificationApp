import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pili_variety_classification/screens/preview_image.dart';
import 'package:pili_variety_classification/utils/app_colors.dart';
import 'package:pili_variety_classification/widgets/app_appBar.dart';
import 'package:pili_variety_classification/widgets/app_banner.dart';
import 'package:pili_variety_classification/widgets/app_icon_button.dart';
import 'package:pili_variety_classification/widgets/circle_avatar.dart';
import 'dart:developer' as devtools;
import 'package:image/image.dart' as imglib;

class RPSScreen extends StatefulWidget {
  static const String id = "rps_screen";
  const RPSScreen({super.key});

  @override
  State<RPSScreen> createState() => _RPSScreenState();
}

class _RPSScreenState extends State<RPSScreen> {
  File? filePath;
  String label = '';
  double confidence = 0.0;
  String input = 'RPS';

  // Load the model
  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/models/EfficientNetB1_lastv3.tflite",
        labels: "assets/label/label.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  // Function to resized image
  String resizedImage(File file) {
    var rawBytes = file.readAsBytesSync();
    var image = imglib.decodeImage(rawBytes);

    // Resize image to 224x224 pixels
    var resizedImage = imglib.copyResize(image!, width: 240, height: 240);

    // Save resized image to a temporary file
    var tempDir = Directory.systemTemp;
    var tempFile = File('${tempDir.path}/resized_image.jpg');
    tempFile.writeAsBytesSync(imglib.encodeJpg(resizedImage));

    // Return the path to the saved resized image
    return tempFile.path;
  }

  // Function to upload picture from the local file
  pickImageGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    var imageMap = File(image.path);

    // Call the resizeImage funtion to resize the image input
    var resImage = resizedImage(imageMap);

    setState(() {
      filePath = imageMap;
    });

    // Run prediction using the Model
    var recognitions = await Tflite.runModelOnImage(
      path: resImage,
      numResults: 5,
      threshold: 0.5,
      asynch: true,
      imageMean: 117.0,
      imageStd: 1.0,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      });
      devtools.log(recognitions.toString());
    }
    // else if (recognitions != null &&
    //     recognitions.length >= 6 &&
    //     recognitions[5]['label'] != null &&
    //     recognitions[5]['label'] == 'ood') {
    //   setState(() {
    //     label = "No Pili Detected";
    //     confidence = 0;
    //   });
    // }
    else {
      setState(() {
        label = "No Pili Detected";
        confidence = 0;
      });
    }

    setState(() {
      Navigator.pushNamed(
        context,
        DisplayImageScreen.id,
        arguments: {
          'filePath': filePath,
          'label': label,
          'confidence': confidence,
          'input': input,
        },
      );
    });

    devtools.log("Navigated to DisplayImageScreen");
  }

  // Function to capture picture  through device camera
  pickImageCamera() async {
    final ImagePicker picker = ImagePicker();
    // Open Camera.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    var imageMap = File(image.path);

    // Call the resizeImage funtion to resize the image input
    var resImage = resizedImage(imageMap);

    setState(() {
      filePath = imageMap;
    });

    // Run Inference using the Model
    var recognitions = await Tflite.runModelOnImage(
      path: resImage,
      numResults: 5,
      threshold: 0.5,
      asynch: true,
      imageMean: 117.0,
      imageStd: 1.0,
    );

    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        confidence = (recognitions[0]['confidence'] * 100);
        label = recognitions[0]['label'].toString();
      });
      devtools.log(recognitions.toString());
    } else {
      setState(() {
        label = "No Pili Detected";
        confidence = 0;
      });
    }

    setState(() {
      Navigator.pushNamed(
        context,
        DisplayImageScreen.id,
        arguments: {
          'filePath': filePath,
          'label': label,
          'confidence': confidence,
          'input': input,
        },
      );
    });

    devtools.log("Navigated to DisplayImageScreen");
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    super.initState();
    _tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: appBar(
        label: 'Raw Pili in the Shell',
        bgColor: primaryColor,
        fontColor: white,
        context: context,
        origPressFunction: true,
      ),
      backgroundColor: primarybgColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBanner(
                height: height,
                isHomeScreen: false,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIconButton(
                              onPress: () => pickImageCamera(),
                              horizontalPadding: 15,
                              verticalPadding: 15,
                              iconData: Icons.camera_rounded,
                              title: "Capture",
                              bgColor: primaryColor,
                              textColor: white,
                            ),
                            const SizedBox(width: 20),
                            AppIconButton(
                              onPress: () => pickImageGallery(),
                              horizontalPadding: 19,
                              verticalPadding: 15,
                              iconData: Icons.upload_rounded,
                              title: "Upload",
                              bgColor: primaryColor,
                              textColor: white,
                            ),
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
            assetImage: 'assets/imgs/shell.png',
            title: 'Raw Pili in the Shell',
            leftPositionMultiplier: 0.25,
            isHomeScreen: false,
          )
        ],
      ),
    ));
  }
}
