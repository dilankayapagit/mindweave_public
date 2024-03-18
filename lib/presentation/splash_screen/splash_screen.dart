import 'controller/iphone_13_pro_max_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

class SplashScreen extends GetWidget<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.back,
            height: getVerticalSize(1500),
            width: getHorizontalSize(428),
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.splashLogo,
            height: getVerticalSize(149),
            width: getHorizontalSize(236),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
