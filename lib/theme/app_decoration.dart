import 'package:flutter/material.dart';
import 'package:mindweave/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get gradientIndigo900Purple900 => BoxDecoration(
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
            ColorConstant.indigo900,
            ColorConstant.purple900,
          ],
        ),
      );
  static BoxDecoration get gradientBlack900Gray80000 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.06,
          ),
          end: Alignment(
            0.5,
            1.39,
          ),
          colors: [
            ColorConstant.black900,
            ColorConstant.gray80000,
          ],
        ),
      );
  static BoxDecoration get outline1 => BoxDecoration(
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
            ColorConstant.indigo9007f,
            ColorConstant.purple9007f,
          ],
        ),
      );
  static BoxDecoration get gradientBlack900Black90000 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            -0.2,
          ),
          end: Alignment(
            0.5,
            0.66,
          ),
          colors: [
            ColorConstant.black900,
            ColorConstant.black90000,
          ],
        ),
      );
  static BoxDecoration get outline => BoxDecoration(
        color: ColorConstant.blueGray1002d,
      );
  static BoxDecoration get outlineWhiteA700 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get gradientDeeppurple900Purple800 => BoxDecoration(
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
      );
  static BoxDecoration get gradientDeeppurple90066Purple80066 => BoxDecoration(
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
            ColorConstant.deepPurple90066,
            ColorConstant.purple80066,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get outlineWhiteA7001 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            2,
          ),
        ),
      );
  static BoxDecoration get fillPurple8007c => BoxDecoration(
        color: ColorConstant.purple8007c,
      );
}

class BorderRadiusStyle {
  static BorderRadius customBorderTL52 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        52,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        52,
      ),
    ),
    bottomLeft: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        32,
      ),
    ),
  );

  static BorderRadius circleBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24,
    ),
  );

  static BorderRadius roundedBorder5 = BorderRadius.circular(
    getHorizontalSize(
      5,
    ),
  );

  static BorderRadius roundedBorder21 = BorderRadius.circular(
    getHorizontalSize(
      21,
    ),
  );

  static BorderRadius customBorderTL21 = BorderRadius.only(
    topLeft: Radius.circular(
      getHorizontalSize(
        21,
      ),
    ),
    topRight: Radius.circular(
      getHorizontalSize(
        21,
      ),
    ),
  );

  static BorderRadius circleBorder48 = BorderRadius.circular(
    getHorizontalSize(
      48,
    ),
  );

  static BorderRadius customBorderBL64 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        64,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        64,
      ),
    ),
  );
}
