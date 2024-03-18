import '../controller/discover_controller.dart';
import '../models/discover_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

// ignore: must_be_immutable
class DiscoverItemWidget extends StatelessWidget {
  DiscoverItemWidget(this.discoverItemModelObj);

  DiscoverItemModel discoverItemModelObj;

  var controller = Get.find<DiscoverController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            imagePath: ImageConstant.imgRectangle4364,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: getPadding(
                left: 20,
                top: 163,
                right: 17,
                bottom: 18,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgVector,
                    height: getVerticalSize(
                      21,
                    ),
                    width: getHorizontalSize(
                      25,
                    ),
                    margin: getMargin(
                      top: 2,
                    ),
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowdown,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
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
