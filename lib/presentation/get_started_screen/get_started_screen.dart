import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'controller/get_started_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

class GetStartedScreen extends GetWidget<GetStartedController> {
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
              begin: Alignment(
                0.5,
                -0.06,
              ),
              end: Alignment(
                0.5,
                1.39,
              ),
              colors: [
                ColorConstant.black900,
                ColorConstant.gray80000,
              ],
            ),
          ),
          child: Container(
            height: size.height,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage4925x427,
                  height: getVerticalSize(
                    925,
                  ),
                  width: getHorizontalSize(
                    427,
                  ),
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: getPadding(
                      left: 37,
                      top: 104,
                      right: 37,
                      bottom: 104,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          ImageConstant.imgGroup18,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        GradientText(
                          "msg_create_realistic".tr,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtMontserratRomanBold40,
                          colors: [
                            ColorConstant.mainBlueColor,
                            ColorConstant.mainPurpleColor
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signUpScreen);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.6)),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorConstant.mainBlueColor
                                        .withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                  ),
                                  BoxShadow(
                                    color: ColorConstant.mainPurpleColor,
                                    spreadRadius: -4,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: getVerticalSize(
                                      60,
                                    ),
                                    width: getHorizontalSize(
                                      348,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          27,
                                        ),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment(
                                          0.05,
                                          -0.19,
                                        ),
                                        end: Alignment(
                                          0.5,
                                          1,
                                        ),
                                        colors: [
                                          ColorConstant.deepPurple900,
                                          ColorConstant.purple800,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "msg_start_with_7_day".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtMontserratRomanSemiBold18,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
