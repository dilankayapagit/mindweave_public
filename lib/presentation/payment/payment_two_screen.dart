import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindweave/presentation/payment/widgets/payment_images.dart';
import 'package:mindweave/presentation/payment/widgets/payment_monthly.dart';
import 'package:mindweave/service/payment_controller.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../widgets/web_widget_custom.dart';
import 'widgets/payment_lifetime.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/widgets/app_bar/custom_app_bar.dart';

class PaymentTwoScreen extends StatefulWidget {
  @override
  State<PaymentTwoScreen> createState() => _PaymentTwoScreenState();
}

class _PaymentTwoScreenState extends State<PaymentTwoScreen> {
  final paymentController = Get.find<PaymentController>();

  var controller = Get.put(PaymentController());

  @override
  void initState() {
    super.initState();
    paymentController.getOfferings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.back,
            height: getVerticalSize(1500),
            width: getHorizontalSize(428),
            alignment: Alignment.center,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              height: getVerticalSize(60),
              leadingWidth: 72,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              title: GradientText(
                "msg_subscription_plans2".tr,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: AppStyle.txtMontserratRomanSemiBold24,
                colors: [
                  ColorConstant.mainBlueColor,
                  ColorConstant.mainPurpleColor
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    PaymentMonthly(
                        PaymentController.payModelList[0], 0, "Monthly"),
                    if (!FirebaseAuth.instance.currentUser!.isAnonymous)
                      SizedBox(
                        height: 20,
                      ),
                    if (!FirebaseAuth.instance.currentUser!.isAnonymous)
                      PaymentLifeTime(
                          PaymentController.payModelList[1], 1, "Lifetime"),
                    SizedBox(
                      height: 20,
                    ),
                    if (!FirebaseAuth.instance.currentUser!.isAnonymous)
                      PaymentImages(PaymentController.payModelList[2], 2),
                    if (!FirebaseAuth.instance.currentUser!.isAnonymous)
                      SizedBox(
                        height: 10,
                      ),
                    GestureDetector(
                      onTap: () {
                        paymentController.restore();
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            51,
                          ),
                          width: getHorizontalSize(
                            215,
                          ),
                          margin: getMargin(
                            top: 24,
                            bottom: 17,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    51,
                                  ),
                                  width: getHorizontalSize(
                                    215,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25,
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
                                  "Restore".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRomanSemiBold16,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      2,
                                    ),
                                    top: getVerticalSize(
                                      2,
                                    ),
                                    right: getHorizontalSize(
                                      2,
                                    ),
                                    bottom: getVerticalSize(
                                      2,
                                    ),
                                  ),
                                  strokeWidth: getHorizontalSize(
                                    2,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0,
                                      0.5,
                                    ),
                                    end: Alignment(
                                      1,
                                      0.5,
                                    ),
                                    colors: [
                                      ColorConstant.tealA2004c,
                                      ColorConstant.purple1004c,
                                      ColorConstant.deepPurpleA2004c,
                                    ],
                                  ),
                                  corners: Corners(
                                    topLeft: Radius.circular(
                                      25,
                                    ),
                                    topRight: Radius.circular(
                                      25,
                                    ),
                                    bottomLeft: Radius.circular(
                                      25,
                                    ),
                                    bottomRight: Radius.circular(
                                      25,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      51,
                                    ),
                                    width: getHorizontalSize(
                                      215,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                        "• Your subscription will be charged to your iTunes account at confirmation of purchase and will automatically renew (at the duration selected) unless auto-renew is turned off at least 24 hours before the end of the current period.\n• Current subscription may not be cancelled during the active subscription period; however, you can manage your subscription and/or turn off auto-renewal by visiting your iTunes Account Settings after purchase."),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(WebWidgetCustom(
                          url:
                              "https://sites.google.com/view/mindweave-privacy-policy/home",
                        ));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            51,
                          ),
                          width: getHorizontalSize(
                            215,
                          ),
                          margin: getMargin(
                            top: 15,
                            bottom: 17,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    51,
                                  ),
                                  width: getHorizontalSize(
                                    215,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25,
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
                                  "Privacy Policy".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRomanSemiBold16,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      2,
                                    ),
                                    top: getVerticalSize(
                                      2,
                                    ),
                                    right: getHorizontalSize(
                                      2,
                                    ),
                                    bottom: getVerticalSize(
                                      2,
                                    ),
                                  ),
                                  strokeWidth: getHorizontalSize(
                                    2,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0,
                                      0.5,
                                    ),
                                    end: Alignment(
                                      1,
                                      0.5,
                                    ),
                                    colors: [
                                      ColorConstant.tealA2004c,
                                      ColorConstant.purple1004c,
                                      ColorConstant.deepPurpleA2004c,
                                    ],
                                  ),
                                  corners: Corners(
                                    topLeft: Radius.circular(
                                      25,
                                    ),
                                    topRight: Radius.circular(
                                      25,
                                    ),
                                    bottomLeft: Radius.circular(
                                      25,
                                    ),
                                    bottomRight: Radius.circular(
                                      25,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      51,
                                    ),
                                    width: getHorizontalSize(
                                      215,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(WebWidgetCustom(
                          url:
                              "https://www.apple.com/legal/internet-services/itunes/dev/stdeula/",
                        ));
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: getVerticalSize(
                            51,
                          ),
                          width: getHorizontalSize(
                            300,
                          ),
                          margin: getMargin(
                            //top: 24,
                            bottom: 25,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: getVerticalSize(
                                    51,
                                  ),
                                  width: getHorizontalSize(
                                    300,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      getHorizontalSize(
                                        25,
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
                                  "END USER LICENSE AGREEMENT".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRomanSemiBold16,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: OutlineGradientButton(
                                  padding: EdgeInsets.only(
                                    left: getHorizontalSize(
                                      2,
                                    ),
                                    top: getVerticalSize(
                                      2,
                                    ),
                                    right: getHorizontalSize(
                                      2,
                                    ),
                                    bottom: getVerticalSize(
                                      2,
                                    ),
                                  ),
                                  strokeWidth: getHorizontalSize(
                                    2,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment(
                                      0,
                                      0.5,
                                    ),
                                    end: Alignment(
                                      1,
                                      0.5,
                                    ),
                                    colors: [
                                      ColorConstant.tealA2004c,
                                      ColorConstant.purple1004c,
                                      ColorConstant.deepPurpleA2004c,
                                    ],
                                  ),
                                  corners: Corners(
                                    topLeft: Radius.circular(
                                      25,
                                    ),
                                    topRight: Radius.circular(
                                      25,
                                    ),
                                    bottomLeft: Radius.circular(
                                      25,
                                    ),
                                    bottomRight: Radius.circular(
                                      25,
                                    ),
                                  ),
                                  child: Container(
                                    height: getVerticalSize(
                                      51,
                                    ),
                                    width: getHorizontalSize(
                                      300,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        getHorizontalSize(
                                          25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapGroup1000001306() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
