import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindweave/presentation/prompt_screen/widgets/prompt_item_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../model/image_model.dart';
import '../../service/payment_controller.dart';
import '../../theme/app_style.dart';
import '../../utils/color_constant.dart';
import '../../utils/image_constant.dart';
import '../../utils/size_utils.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/prompt_controller.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var controller = Get.put(PromptWidgetController());
  var paymentController = Get.find<PaymentController>();

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
            appBar: CustomAppBar(
              height: getVerticalSize(85),
              leadingWidth: 62,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              title: GradientText(
                "Results".tr,
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
            body: Padding(
              padding: getPadding(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      itemCount: controller.imageList.length,
                      itemBuilder: (context, index) {
                        ImageModel model = controller.imageList[index];

                        return GestureDetector(
                          onTap: () {
                            controller.dialogPic(
                              model,
                              isGenarte: true,
                            );
                          },
                          child: PromptItemWidget(
                            model,
                            isGenarte: true,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3)),
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
                              "Go Back".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtMontserratRomanSemiBold18,
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
    );
  }
}
