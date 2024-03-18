import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindweave/model/user_custom_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../service/authentication_controller.dart';
import 'controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/utils/validation_functions.dart';
import 'package:mindweave/widgets/app_bar/appbar_image.dart';
import 'package:mindweave/widgets/app_bar/custom_app_bar.dart';
import 'package:mindweave/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var controller = Get.put(RegisterController());

  var userController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            CustomImageView(
                imagePath: ImageConstant.back,
                height: getVerticalSize(926),
                width: getHorizontalSize(425),
                alignment: Alignment.center),
            Form(
              key: _formKey,
              child: Container(
                height: size.height,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: getPadding(top: 16, bottom: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomAppBar(
                                height: getVerticalSize(106),
                                leadingWidth: 72,
                                centerTitle: true,
                                title: AppbarImage(
                                    height: getSize(106),
                                    width: getSize(106),
                                    imagePath:
                                        ImageConstant.img12301removebgpreview)),
                            SizedBox(
                              height: size.height * 0.15,
                            ),
                            GradientText(
                              "lbl_register".tr,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyle.txtMontserratRomanSemiBold24,
                              colors: [
                                ColorConstant.mainBlueColor,
                                ColorConstant.mainPurpleColor
                              ],
                            ),
                            // Padding(
                            //     padding: getPadding(top: 18),
                            //     child: RichText(
                            //         text: TextSpan(children: [
                            //           TextSpan(
                            //               text: "msg_if_you_need_any2".tr,
                            //               style: TextStyle(
                            //                   color: ColorConstant.whiteA700,
                            //                   fontSize: getFontSize(16),
                            //                   fontFamily: 'Montserrat',
                            //                   fontWeight: FontWeight.w400)),
                            //           TextSpan(
                            //               text: " ".tr,
                            //               style: TextStyle(
                            //                   color: ColorConstant.purpleA400,
                            //                   fontSize: getFontSize(16),
                            //                   fontFamily: 'Montserrat',
                            //                   fontWeight: FontWeight.w400)),
                            //           TextSpan(
                            //               text: "lbl_click_here".tr,
                            //               style: TextStyle(
                            //                   color: ColorConstant.purpleA400,
                            //                   fontSize: getFontSize(16),
                            //                   fontFamily: 'Montserrat',
                            //                   fontWeight: FontWeight.w400))
                            //         ]),
                            //         textAlign: TextAlign.left)),
                            CustomTextFormField(
                              focusNode: FocusNode(),
                              controller: controller.fullnameController,
                              hintText: "lbl_full_name".tr,
                              margin: getMargin(left: 40, top: 18, right: 40),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid name";
                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: controller.emailController,
                                hintText: "lbl_enter_email".tr,
                                margin: getMargin(left: 40, top: 18, right: 40),
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null ||
                                      (!isValidEmail(value,
                                          isRequired: true))) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                }),
                            Obx(() => CustomTextFormField(
                                focusNode: FocusNode(),
                                controller: controller.passwordController,
                                hintText: "lbl_password".tr,
                                margin: getMargin(left: 40, top: 20, right: 40),
                                padding: TextFormFieldPadding.PaddingT18_1,
                                textInputType: TextInputType.visiblePassword,
                                suffix: InkWell(
                                    onTap: () {
                                      controller.isShowPassword.value =
                                          !controller.isShowPassword.value;
                                    },
                                    child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 14,
                                          right: 24,
                                          bottom: 11),
                                      child: controller.isShowPassword.value
                                          ? FaIcon(FontAwesomeIcons.eye)
                                          : FaIcon(FontAwesomeIcons.eyeSlash),

                                      // CustomImageView(
                                      //     svgPath:
                                      //         controller.isShowPassword.value
                                      //             ? ImageConstant.imgReply
                                      //             : ImageConstant.imgBox)
                                    )),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(51)),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                isObscureText:
                                    !controller.isShowPassword.value)),
                            GestureDetector(
                              onTap: () {
                                if (!(_formKey.currentState!.validate())) {
                                  Fluttertoast.showToast(
                                      msg: "Add all the feilds",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  return;
                                }

                                userController.register(
                                  UserCustomModel(
                                    name: controller.fullnameController.text,
                                    email: controller.emailController.text,
                                    pw: controller.passwordController.text,
                                  ),
                                );
                              },
                              child: Container(
                                  height: getVerticalSize(51),
                                  width: getHorizontalSize(348),
                                  margin: getMargin(top: 26),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                height: getVerticalSize(51),
                                                width: getHorizontalSize(348),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                25)),
                                                    gradient: LinearGradient(
                                                        begin: Alignment(
                                                            0.05, -0.19),
                                                        end: Alignment(0.5, 1),
                                                        colors: [
                                                          ColorConstant
                                                              .deepPurple900,
                                                          ColorConstant
                                                              .purple800
                                                        ])))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Text("lbl_register".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtMontserratRomanSemiBold16)),
                                        Align(
                                            alignment: Alignment.center,
                                            child: OutlineGradientButton(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(2),
                                                    top: getVerticalSize(2),
                                                    right: getHorizontalSize(2),
                                                    bottom: getVerticalSize(2)),
                                                strokeWidth:
                                                    getHorizontalSize(2),
                                                gradient: LinearGradient(
                                                    begin: Alignment(0, 0.5),
                                                    end: Alignment(1, 0.5),
                                                    colors: [
                                                      ColorConstant.tealA2004c,
                                                      ColorConstant.purple1004c,
                                                      ColorConstant
                                                          .deepPurpleA2004c
                                                    ]),
                                                corners: Corners(
                                                    topLeft:
                                                        Radius.circular(25),
                                                    topRight:
                                                        Radius.circular(25),
                                                    bottomLeft:
                                                        Radius.circular(25),
                                                    bottomRight:
                                                        Radius.circular(25)),
                                                child: Container(
                                                    height: getVerticalSize(51),
                                                    width:
                                                        getHorizontalSize(348),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    25))))))
                                      ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                onTapTxtHaveanaccount();
                              },
                              child: Padding(
                                padding: getPadding(top: 35, bottom: 79),
                                child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "msg_have_an_account2".tr,
                                            style: TextStyle(
                                                color: ColorConstant.whiteA700,
                                                fontSize: getFontSize(16),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.w600)),
                                        TextSpan(
                                          text: " ".tr,
                                          style: TextStyle(
                                              color: ColorConstant.purpleA400,
                                              fontSize: getFontSize(16),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        TextSpan(
                                          text: "lbl_login".tr,
                                          style: TextStyle(
                                              color: ColorConstant.purpleA400,
                                              fontSize: getFontSize(16),
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left),
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
    );
  }

  onTapGroup1000001304() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onTapTxtHaveanaccount() {
    Get.offNamed(AppRoutes.loginScreen);
  }
}
