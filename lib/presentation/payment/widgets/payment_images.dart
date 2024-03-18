import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindweave/service/payment_controller.dart';

import '../../../model/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

import '../../../service/user_controller.dart';

// ignore: must_be_immutable
class PaymentImages extends StatelessWidget {
  PaymentImages(this.paymentModel, this.index);
  var userController = Get.put(UserController());

  PaymentModel paymentModel;
  var controller = Get.find<PaymentController>();
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: OutlineGradientButton(
        padding: EdgeInsets.only(
          left: getHorizontalSize(
            1,
          ),
          top: getVerticalSize(
            1,
          ),
          right: getHorizontalSize(
            1,
          ),
          bottom: getVerticalSize(
            1,
          ),
        ),
        strokeWidth: getHorizontalSize(
          1,
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
            ColorConstant.tealA200,
            ColorConstant.purple100,
            ColorConstant.deepPurpleA200,
          ],
        ),
        corners: Corners(
          topLeft: Radius.circular(
            19,
          ),
          topRight: Radius.circular(
            19,
          ),
          bottomLeft: Radius.circular(
            19,
          ),
          bottomRight: Radius.circular(
            19,
          ),
        ),
        child: Container(
          decoration: AppDecoration.outline1.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder21,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  width: getHorizontalSize(
                    360,
                  ),
                  padding: getPadding(
                    left: 25,
                    top: 10,
                    right: 25,
                    bottom: 10,
                  ),
                  decoration: AppDecoration.fillPurple8007c.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL21,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${paymentModel.payName ?? ""}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRomanSemiBold16,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 25,
                  top: 11,
                ),
                child: Row(
                  children: [
                    OutlineGradientButton(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          1,
                        ),
                        top: getVerticalSize(
                          1,
                        ),
                        right: getHorizontalSize(
                          1,
                        ),
                        bottom: getVerticalSize(
                          1,
                        ),
                      ),
                      strokeWidth: getHorizontalSize(
                        1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(
                          0.5,
                          0,
                        ),
                        end: Alignment(
                          0.5,
                          1,
                        ),
                        colors: [
                          ColorConstant.lightBlueA200,
                          ColorConstant.purpleA400,
                        ],
                      ),
                      corners: Corners(
                        topLeft: Radius.circular(
                          4,
                        ),
                        topRight: Radius.circular(
                          4,
                        ),
                        bottomLeft: Radius.circular(
                          4,
                        ),
                        bottomRight: Radius.circular(
                          4,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8,
                        ),
                        width: getSize(
                          8,
                        ),
                        // margin: getMargin(
                        //   top: 6,
                        //   bottom: 3,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 7,
                      ),
                      child: Text(
                        paymentModel.packs![0],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRomanRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 25,
                  top: 9,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlineGradientButton(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          1,
                        ),
                        top: getVerticalSize(
                          1,
                        ),
                        right: getHorizontalSize(
                          1,
                        ),
                        bottom: getVerticalSize(
                          1,
                        ),
                      ),
                      strokeWidth: getHorizontalSize(
                        1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(
                          0.5,
                          0,
                        ),
                        end: Alignment(
                          0.5,
                          1,
                        ),
                        colors: [
                          ColorConstant.lightBlueA200,
                          ColorConstant.purpleA400,
                        ],
                      ),
                      corners: Corners(
                        topLeft: Radius.circular(
                          4,
                        ),
                        topRight: Radius.circular(
                          4,
                        ),
                        bottomLeft: Radius.circular(
                          4,
                        ),
                        bottomRight: Radius.circular(
                          4,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8,
                        ),
                        width: getSize(
                          8,
                        ),
                        // margin: getMargin(
                        //   top: 4,
                        //   bottom: 5,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 7,
                      ),
                      child: Text(
                        paymentModel.packs![1],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRomanRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 25,
                  top: 6,
                ),
                child: Row(
                  children: [
                    OutlineGradientButton(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          1,
                        ),
                        top: getVerticalSize(
                          1,
                        ),
                        right: getHorizontalSize(
                          1,
                        ),
                        bottom: getVerticalSize(
                          1,
                        ),
                      ),
                      strokeWidth: getHorizontalSize(
                        1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(
                          0.5,
                          0,
                        ),
                        end: Alignment(
                          0.5,
                          1,
                        ),
                        colors: [
                          ColorConstant.lightBlueA200,
                          ColorConstant.purpleA400,
                        ],
                      ),
                      corners: Corners(
                        topLeft: Radius.circular(
                          4,
                        ),
                        topRight: Radius.circular(
                          4,
                        ),
                        bottomLeft: Radius.circular(
                          4,
                        ),
                        bottomRight: Radius.circular(
                          4,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8,
                        ),
                        width: getSize(
                          8,
                        ),
                        // margin: getMargin(
                        //   top: 6,
                        //   bottom: 3,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 7,
                      ),
                      child: Text(
                        paymentModel.packs![2],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRomanRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 25,
                  top: 6,
                ),
                child: Row(
                  children: [
                    OutlineGradientButton(
                      padding: EdgeInsets.only(
                        left: getHorizontalSize(
                          1,
                        ),
                        top: getVerticalSize(
                          1,
                        ),
                        right: getHorizontalSize(
                          1,
                        ),
                        bottom: getVerticalSize(
                          1,
                        ),
                      ),
                      strokeWidth: getHorizontalSize(
                        1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(
                          0.5,
                          0,
                        ),
                        end: Alignment(
                          0.5,
                          1,
                        ),
                        colors: [
                          ColorConstant.lightBlueA200,
                          ColorConstant.purpleA400,
                        ],
                      ),
                      corners: Corners(
                        topLeft: Radius.circular(
                          4,
                        ),
                        topRight: Radius.circular(
                          4,
                        ),
                        bottomLeft: Radius.circular(
                          4,
                        ),
                        bottomRight: Radius.circular(
                          4,
                        ),
                      ),
                      child: Container(
                        height: getSize(
                          8,
                        ),
                        width: getSize(
                          8,
                        ),
                        // margin: getMargin(
                        //   top: 6,
                        //   bottom: 3,
                        // ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 7,
                      ),
                      child: Text(
                        "Non-Auto Renewable",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtMontserratRomanRegular14,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (controller.isSubscribe.value ||
                      (userController.userCustomModel.value.isLife ?? false)) {
                    Fluttertoast.showToast(
                        msg: "You already subscribed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return;
                  }

                  if (FirebaseAuth.instance.currentUser!.isAnonymous) {
                    Fluttertoast.showToast(
                        msg: "Please signin.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    return;
                  }
                  controller.makePurchases(index,"mind_20_img");
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      75,
                    ),
                    width: getHorizontalSize(
                      350,
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
                              75,
                            ),
                            width: getHorizontalSize(
                              350,
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
                        Obx(
                          () => Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: getPadding(
                                bottom: 13,
                              ),
                              child: Text(
                                "Billed Once\n${controller.packs[index]} / 20 images"
                                    .tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtMontserratRomanSemiBold18,
                              ),
                            ),
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
                                75,
                              ),
                              width: getHorizontalSize(
                                350,
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
    );
  }
}
