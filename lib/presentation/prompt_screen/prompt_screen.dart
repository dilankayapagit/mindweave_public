import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../model/promts_model.dart';
import '../../service/payment_controller.dart';
import 'controller/prompt_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/widgets/app_bar/custom_app_bar.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class PromptScreen extends StatefulWidget {
  @override
  State<PromptScreen> createState() => _PromptScreenState();
}

class _PromptScreenState extends State<PromptScreen> {
  var controller = Get.put(PromptWidgetController());
  TextEditingController textEditingController = TextEditingController();
  var paymentController = Get.put(PaymentController());

  //
  var sizeSelections = ImageSize.size512;
  var sizeSelectionsIndex = 1;
  //
  var imgCntIndex = 1;
  var imgCnt = 2;

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      textEditingController = TextEditingController(
          text:
              "Two astronauts exploring the dark, cavernous interior of a huge derelict spacecraft, digital art");
    }
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageView(
          imagePath: ImageConstant.back,
          height: getVerticalSize(924),
          width: getHorizontalSize(428),
          alignment: Alignment.center,
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusScope.of(context).unfocus();
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.all(16.0),
            child: Scaffold(
              appBar: CustomAppBar(
                height: getVerticalSize(85),
                leadingWidth: 62,
                centerTitle: true,
                title: GradientText(
                  "lbl_create_artworks".tr,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.txtMontserratRomanSemiBold24,
                  colors: [
                    ColorConstant.mainBlueColor,
                    ColorConstant.mainPurpleColor
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 50,
                    top: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: getPadding(top: 10),
                            child: Text("lbl_enter_prompt".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRomanSemiBold20),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding:
                                  getPadding(top: 5, left: size.width * 0.4),
                              child: Text(
                                "${textEditingController.text.length}/300".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtMontserratRomanSemiBold12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Padding(
                          padding: getPadding(top: 20),
                          child: OutlineGradientButton(
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(1),
                                top: getVerticalSize(1),
                                right: getHorizontalSize(1),
                                bottom: getVerticalSize(1)),
                            strokeWidth: getHorizontalSize(1),
                            gradient: LinearGradient(
                              begin: Alignment(0, 0.5),
                              end: Alignment(1, 0.5),
                              colors: [
                                ColorConstant.tealA200,
                                ColorConstant.purple100,
                                ColorConstant.deepPurpleA200
                              ],
                            ),
                            corners: Corners(
                              topLeft: Radius.circular(19),
                              topRight: Radius.circular(19),
                              bottomLeft: Radius.circular(19),
                              bottomRight: Radius.circular(19),
                            ),
                            child: Container(
                              width: getHorizontalSize(360),
                              padding: getPadding(
                                  left: 15, top: 15, right: 15, bottom: 15),
                              decoration: AppDecoration.outline.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder21),
                              child: SizedBox(
                                height: 160,
                                child: TextFormField(
                                  controller: textEditingController,
                                  maxLength: 300,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "lbl_enter_prompt".tr,
                                    hintStyle:
                                        AppStyle.txtMontserratRomanRegular18,
                                  ),
                                  onChanged: (_) {
                                    setState(() {});
                                  },
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  maxLines: 10,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRomanRegular18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Quality".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratRomanSemiBold20),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ToggleSwitch(
                          activeBgColor: [
                            ColorConstant.mainPurpleColor,
                            ColorConstant.mainPurpleColor,
                            ColorConstant.mainPurpleColor,
                          ],
                          minWidth: size.width * 0.2,
                          initialLabelIndex: sizeSelectionsIndex,
                          totalSwitches: 3,
                          labels: ['1024 px', '512 px', '256 px'],
                          onToggle: (index) {
                            FocusScope.of(context).unfocus();

                            sizeSelectionsIndex = index!;
                            if (index == 0) {
                              sizeSelections = ImageSize.size1024;
                            } else if (index == 1) {
                              sizeSelections = ImageSize.size512;
                            } else {
                              sizeSelections = ImageSize.size256;
                            }
                            print('switched to: $index');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Images".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtMontserratRomanSemiBold20),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ToggleSwitch(
                          activeBgColor: [
                            ColorConstant.mainPurpleColor,
                            ColorConstant.mainPurpleColor,
                            ColorConstant.mainPurpleColor,
                            ColorConstant.mainPurpleColor,
                          ],
                          minWidth: size.width * 0.2,
                          initialLabelIndex: imgCntIndex,
                          totalSwitches: 4,
                          labels: ['1', '2', '4', '6'],
                          onToggle: (index) {
                            FocusScope.of(context).unfocus();

                            imgCntIndex = index!;
                            if (index == 0) {
                              imgCnt = 1;
                            } else if (index == 1) {
                              imgCnt = 2;
                            } else if (index == 2) {
                              imgCnt = 4;
                            } else {
                              imgCnt = 6;
                            }
                            print('switched to: $index');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () async {
                          paymentController.isProMember();
                          FocusScope.of(context).unfocus();
                          await controller.genarate(
                            PromtsModel(
                              promt: textEditingController.text,
                              imgCnt: imgCnt,
                              size: sizeSelections,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Colors.white.withOpacity(0.3)),
                          ),
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
                                    390,
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
                                  "lbl_generate".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtMontserratRomanSemiBold18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                          "⌛️ Size and image count affect download speed and latencies."
                              .tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: AppStyle.txtMontserratRomanSemiBold12
                              .copyWith(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
