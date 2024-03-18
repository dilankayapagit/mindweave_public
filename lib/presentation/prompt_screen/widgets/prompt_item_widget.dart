import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindweave/model/image_model.dart';

import '../../../service/image_controller.dart';
import '../../../service/payment_controller.dart';
import '../../../service/user_controller.dart';
import '../controller/prompt_controller.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

// ignore: must_be_immutable
class PromptItemWidget extends StatefulWidget {
  PromptItemWidget(this.imageModel,
      {this.isGenarte = false, this.isDemo = false, this.index = 0});

  ImageModel imageModel;
  bool isGenarte;
  bool isDemo;
  int index;
  @override
  State<PromptItemWidget> createState() => _PromptItemWidgetState();
}

class _PromptItemWidgetState extends State<PromptItemWidget> {
  var controller = Get.find<PromptWidgetController>();
  var imageController = Get.find<ImageController>();
  var paymentController = Get.find<PaymentController>();
  var userController = Get.find<UserController>();

  @override
  void initState() {
    super.initState();
    model = widget.imageModel;
  }

  @override
  void dispose() {
    super.dispose();
    model = ImageModel(isFav: false);
  }

  var model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getVerticalSize(
            205,
          ),
          width: getHorizontalSize(
            170,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                url: widget.imageModel.url,
                fit: BoxFit.cover,
                height: getVerticalSize(
                  205,
                ),
                width: getHorizontalSize(
                  170,
                ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    21,
                  ),
                ),
                alignment: Alignment.center,
              ),
              if (!widget.isDemo)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: getPadding(
                      left: 18,
                      top: 166,
                      right: 16,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (model.isFav)
                          GestureDetector(
                            onTap: () async {
                              if (widget.isGenarte) {
                                if (await imageController
                                    .removeFavourite(widget.imageModel)) {
                                  model =
                                      widget.imageModel.copyWith(isFav: false);
                                }
                              } else {
                                await imageController
                                    .removeFavourite(widget.imageModel);
                              }
                              setState(() {});
                            },
                            child: FaIcon(
                              FontAwesomeIcons.solidHeart,
                              color: ColorConstant.mainPurpleColor,
                            ),
                          ),
                        if (!model.isFav)
                          GestureDetector(
                            onTap: () {
                              imageController
                                  .downloadAndAddFav(widget.imageModel);
                              model = widget.imageModel.copyWith(isFav: true);
                              setState(() {});
                            },
                            child: FaIcon(
                              FontAwesomeIcons.heart,
                              color: ColorConstant.mainPurpleColor,
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                            controller.download(widget.imageModel);
                          },
                          child: CustomImageView(
                            svgPath: ImageConstant.imgArrowdown,
                            height: getSize(
                              24,
                            ),
                            width: getSize(
                              24,
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
        if (widget.isGenarte &&
            widget.index != 0 &&
            !paymentController.isPro.value)
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.paymentTwoScreen);
            },
            child: Container(
              height: getVerticalSize(
                205,
              ),
              width: getHorizontalSize(
                170,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey,
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.lock,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
