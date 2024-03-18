import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../service/dialog_controller.dart';
import '../../service/image_controller.dart';
import '../../service/payment_controller.dart';
import '../../service/promt_controller.dart';
import '../../service/user_controller.dart';
import '../bottom_nav/controller/discover_container_controller.dart';
import 'controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var controller = Get.put(ProfileController());
  var imageController = Get.find<ImageController>();
  var paymentController = Get.find<PaymentController>();
  var discoverContainerController = Get.find<BottomNavController>();
  var promtController = Get.find<PromtController>();
  var userController = Get.find<UserController>();
  var dialogController = Get.find<DialogController>();

  @override
  void initState() {
    super.initState();
    controller.getDetails();
    promtController.getPromts();
    paymentController.getOfferings();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //minimum: const EdgeInsets.all(16.0),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Stack(
            children: [
              Container(
                color: Colors.black,
                height: size.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.back,
                      height: getVerticalSize(924),
                      width: getHorizontalSize(428),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: getVerticalSize(800),
                    width: double.maxFinite,
                    //decoration: AppDecoration.gradientBlack900Black90000,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgImage4,
                            height: getVerticalSize(924),
                            width: getHorizontalSize(428),
                            alignment: Alignment.center),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.maxFinite,
                                  child: Container(
                                      padding: getPadding(top: 25, bottom: 49),
                                      decoration: AppDecoration
                                          .gradientDeeppurple90066Purple80066
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .customBorderBL64),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: CustomAppBar(
                                                height: getVerticalSize(32),
                                                leadingWidth: 62,
                                                centerTitle: true,
                                                title: GradientText(
                                                  "lbl_profile".tr,
                                                  textAlign: TextAlign.left,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: AppStyle
                                                      .txtMontserratRomanSemiBold24,
                                                  colors: [
                                                    ColorConstant.mainBlueColor,
                                                    ColorConstant
                                                        .mainPurpleColor
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            !controller.user.value.isAnonymous
                                                ? GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .profilePicChange();
                                                    },
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                          height: getSize(96),
                                                          width: getSize(96),
                                                          child:
                                                              CustomImageView(
                                                            url: controller.user
                                                                .value.photoURL,
                                                            fit: BoxFit.cover,
                                                            height: getSize(96),
                                                            width: getSize(96),
                                                            // color: Colors.white,
                                                            radius: BorderRadius
                                                                .circular(
                                                              getHorizontalSize(
                                                                  48),
                                                            ),
                                                            // margin: getMargin(top: 24),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: getSize(96),
                                                          width: getSize(96),
                                                          child: Center(
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            3,
                                                                        right:
                                                                            5),
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .camera,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: getSize(96),
                                                    width: getSize(96),
                                                    child: CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgRectangle4367,
                                                      fit: BoxFit.cover,
                                                      height: getSize(96),
                                                      width: getSize(96),
                                                      //color: Colors.white,
                                                      radius:
                                                          BorderRadius.circular(
                                                        getHorizontalSize(48),
                                                      ),
                                                      // margin: getMargin(top: 24),
                                                    ),
                                                  ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.rename();
                                              },
                                              child: Padding(
                                                  padding: getPadding(top: 17),
                                                  child: Text(
                                                      "${controller.user.value.displayName ?? "Anon"}"
                                                          .tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtMontserratRomanSemiBold20)),
                                            ),
                                            Padding(
                                                padding: getPadding(top: 7),
                                                child: Text(
                                                    "${controller.user.value.email ?? "anon@mindweave.com"}"
                                                        .tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .txtMontserratRomanRegular16)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            if (paymentController
                                                    .isSubscribe.value ||
                                                (userController.userCustomModel
                                                        .value.isLife ??
                                                    false))
                                              AnimatedTextKit(
                                                totalRepeatCount: 3,
                                                animatedTexts: [
                                                  ColorizeAnimatedText(
                                                    'Premium Member',
                                                    textStyle: TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily: 'Horizon',
                                                    ),
                                                    colors: [
                                                      Colors.purple,
                                                      Colors.blue,
                                                      Colors.yellow,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            Padding(
                                                padding: getPadding(
                                                    left: 95,
                                                    top: 33,
                                                    right: 95),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          discoverContainerController
                                                              .changeBottomNav(
                                                                  1);
                                                        },
                                                        child: Padding(
                                                            padding: getPadding(
                                                                top: 1),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "lbl_prompts"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtMontserratRomanRegular12WhiteA700),
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              7),
                                                                      child: Text(
                                                                          "${userController.userCustomModel.value.usedPromts ?? 0} ${paymentController.isSubscribe.value ? "" : " / ${userController.userCustomModel.value.maxPromts ?? 0}"}"
                                                                              .tr,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          textAlign: TextAlign
                                                                              .left,
                                                                          style:
                                                                              AppStyle.txtMontserratRomanSemiBold20))
                                                                ])),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          discoverContainerController
                                                              .changeBottomNav(
                                                                  0);
                                                        },
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "lbl_favorites"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtMontserratRomanRegular12WhiteA700),
                                                              Padding(
                                                                  padding:
                                                                      getPadding(
                                                                          top:
                                                                              8),
                                                                  child: Text(
                                                                      "${imageController.imageModelList.length}"
                                                                          .tr,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: AppStyle
                                                                          .txtMontserratRomanSemiBold20))
                                                            ]),
                                                      )
                                                    ]))
                                          ]))),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: getPadding(left: 56, top: 23),
                                  child: Text(
                                    "Settings".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtMontserratRomanSemiBold20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Get.toNamed(AppRoutes.paymentTwoScreen);
                                  } catch (e) {}
                                },
                                child: Container(
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
                                            360,
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
                                          "Manage Subscriptions".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtMontserratRomanSemiBold18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    controller.deleteAccount();
                                  } catch (e) {}
                                },
                                child: Container(
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
                                            360,
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
                                          "Delete Account".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtMontserratRomanSemiBold18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  try {
                                    dialogController.loading();
                                    Purchases.logOut();
                                    await FirebaseAuth.instance.signOut();
                                    discoverContainerController
                                        .changeBottomNav(0);
                                    Get.offAllNamed(AppRoutes.splashScreen);
                                  } on FirebaseAuthException catch (e) {
                                    Get.back();
                                    Fluttertoast.showToast(
                                        msg: e.message ?? "",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 5,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  } catch (e) {
                                    Get.back();
                                    log("logout" + e.toString());
                                  }
                                },
                                child: Container(
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
                                            360,
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
                                          "Logout".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .txtMontserratRomanSemiBold18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
