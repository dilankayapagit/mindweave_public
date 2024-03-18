import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mindweave/service/payment_controller.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../model/image_model.dart';
import '../../service/image_controller.dart';
import '../../service/user_controller.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/prompt_item_widget.dart';
import '../bottom_nav/controller/discover_container_controller.dart';
import '../prompt_screen/controller/prompt_controller.dart';
import '../prompt_screen/widgets/prompt_item_widget.dart';
import 'controller/discover_controller.dart';
import 'models/discover_model.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/widgets/custom_text_form_field.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DiscoverController controller =
      Get.put(DiscoverController(DiscoverModel().obs));
  var imageController = Get.put(ImageController());
  var promptController = Get.find<PromptWidgetController>();
  var discoverContainerController = Get.find<BottomNavController>();
  var paymentController = Get.find<PaymentController>();

  var userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();

    userController.getUser();
    imageController.getFav();
    paymentController.getSubscribeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.back,
            height: getVerticalSize(924),
            width: getHorizontalSize(428),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          SafeArea(
            minimum: const EdgeInsets.all(16.0),
            child: Scaffold(
              appBar: CustomAppBar(
                height: getVerticalSize(85),
                leadingWidth: 62,
                centerTitle: true,
                title: GradientText(
                  "Home".tr,
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
                  padding: getPadding(
                    left: 20,
                    top: 16,
                    right: 20,
                    bottom: 50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: getVerticalSize(
                          38,
                        ),
                        width: getHorizontalSize(
                          372,
                        ),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgSearch,
                              height: getSize(
                                17,
                              ),
                              width: getSize(
                                17,
                              ),
                              alignment: Alignment.centerRight,
                              margin: getMargin(
                                right: 17,
                              ),
                            ),
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
                              child: CustomTextFormField(
                                onChanged: () {
                                  imageController.getSearch();
                                },
                                width: getHorizontalSize(
                                  372,
                                ),
                                focusNode: FocusNode(),
                                controller: imageController.txtController.value,
                                hintText: "lbl_search".tr,
                                variant: TextFormFieldVariant.Outline,
                                shape: TextFormFieldShape.CircleBorder19,
                                padding: TextFormFieldPadding.PaddingAll11,
                                textInputAction: TextInputAction.done,
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(
                            top: 32,
                          ),
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontFamily: 'Agne',
                            ),
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(
                                    'Create pictures with any prompt.'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (imageController.imageModelSearchList.length != 0)
                        Padding(
                          padding: getPadding(
                            top: 32,
                          ),
                          child: Obx(
                            () => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: getVerticalSize(
                                  206,
                                ),
                                crossAxisCount: 2,
                                mainAxisSpacing: getHorizontalSize(
                                  22,
                                ),
                                crossAxisSpacing: getHorizontalSize(
                                  22,
                                ),
                              ),
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  imageController.imageModelSearchList.length,
                              itemBuilder: (context, index) {
                                ImageModel model =
                                    imageController.imageModelSearchList[index];
                                return GestureDetector(
                                  onTap: () {
                                    promptController.dialogPic(model);
                                  },
                                  child: Hero(
                                    tag: model.name ?? "",
                                    child: PromptItemWidget(
                                      model,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      //if (imageController.imageModelSearchList.length == 0)

                      if (imageController.imageModelSearchList.length == 0)
                        GestureDetector(
                          onTap: () {
                            discoverContainerController.changeBottomNav(1);
                          },
                          child: Padding(
                              padding: getPadding(
                                top: 32,
                              ),
                              child: DemoImageWidget()),
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
