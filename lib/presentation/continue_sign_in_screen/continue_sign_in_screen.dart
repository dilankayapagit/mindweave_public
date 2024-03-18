import 'dart:io';

import '../../service/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class ContinueSignInScreen extends StatefulWidget {
  @override
  State<ContinueSignInScreen> createState() => _ContinueSignInScreenState();
}

class _ContinueSignInScreenState extends State<ContinueSignInScreen> {
  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, -0.2),
              end: Alignment(0.5, 0.66),
              colors: [ColorConstant.black900, ColorConstant.black90000],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgS1,
                  height: getVerticalSize(926),
                  width: getHorizontalSize(425),
                  alignment: Alignment.center),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: getPadding(left: 39, right: 39, bottom: 77),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Container(
                          height: getVerticalSize(51),
                          width: getHorizontalSize(348),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(51),
                                  width: getHorizontalSize(348),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25)),
                                    gradient: LinearGradient(
                                      begin: Alignment(0.05, -0.19),
                                      end: Alignment(0.5, 1),
                                      colors: [
                                        ColorConstant.deepPurple900,
                                        ColorConstant.purple800
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: getPadding(bottom: 13),
                                  child: Text("lbl_login".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtMontserratRomanSemiBold16),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                      left: getHorizontalSize(2),
                                      top: getVerticalSize(2),
                                      right: getHorizontalSize(2),
                                      bottom: getVerticalSize(2)),
                                  strokeWidth: getHorizontalSize(2),
                                  gradient: LinearGradient(
                                      begin: Alignment(0, 0.5),
                                      end: Alignment(1, 0.5),
                                      colors: [
                                        ColorConstant.tealA2004c,
                                        ColorConstant.purple1004c,
                                        ColorConstant.deepPurpleA2004c
                                      ]),
                                  corners: Corners(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25)),
                                  child: Container(
                                    height: getVerticalSize(51),
                                    width: getHorizontalSize(348),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(25),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (Platform.isIOS)
                        SizedBox(
                          height: 20,
                        ),
                      if (Platform.isIOS)
                        GestureDetector(
                          onTap: () {
                            controller.signInWithApple();
                          },
                          child: Container(
                            padding: getPadding(top: 10, bottom: 10),
                            decoration: AppDecoration.outlineWhiteA700.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.appleIcon,
                                  height: getVerticalSize(35),
                                  width: getHorizontalSize(35),
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: getPadding(top: 5, bottom: 2),
                                  child: Text("Continue with Apple".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtMontserratRomanSemiBold16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.signInWithGoogle();
                        },
                        child: Container(
                          padding: getPadding(top: 10, bottom: 10),
                          decoration: AppDecoration.outlineWhiteA700.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgGoogle,
                                  height: getVerticalSize(28),
                                  width: getHorizontalSize(29)),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: getPadding(top: 5, bottom: 2),
                                child: Text("msg_continue_with_google".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtMontserratRomanSemiBold16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.signInWithAnon();
                        },
                        child: Padding(
                          padding: getPadding(top: 20),
                          child: Text("Skip".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratRomanSemiBold20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
