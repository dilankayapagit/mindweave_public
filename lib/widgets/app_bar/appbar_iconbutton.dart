import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/widgets/custom_icon_button.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

// ignore: must_be_immutable
class AppbarIconbutton extends StatelessWidget {
  AppbarIconbutton({this.imagePath, this.svgPath, this.margin, this.onTap});

  String? imagePath;

  String? svgPath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
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
              16,
            ),
            topRight: Radius.circular(
              16,
            ),
            bottomLeft: Radius.circular(
              16,
            ),
            bottomRight: Radius.circular(
              16,
            ),
          ),
          child: CustomIconButton(
            height: 32,
            width: 32,
            child: CustomImageView(
              svgPath: svgPath,
              imagePath: imagePath,
            ),
          ),
        ),
      ),
    );
  }
}
