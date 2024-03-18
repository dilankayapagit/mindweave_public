import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

// ignore: must_be_immutable
class DemoImageWidget extends StatefulWidget {
  @override
  State<DemoImageWidget> createState() => _DemoImageWidgetState();
}

class _DemoImageWidgetState extends State<DemoImageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var model;
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
            imagePath: ImageConstant.imgRectangle4366,
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
        ],
      ),
    );
  }
}
