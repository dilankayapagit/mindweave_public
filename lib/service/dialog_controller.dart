import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mindweave/core/app_export.dart';

class DialogController extends GetxController {
  loading({String title = "Loading..."}) {
    Get.defaultDialog(
      barrierDismissible: false,
      content: Lottie.asset(
        'assets/lottie/125918-flutter-loading-indicator.json',
        height: 75,
        width: 75,
      ),
      title: title,
    );
  }

  paymentSuccesfulDialog() {
    Get.defaultDialog(
      content: Column(
        children: [
          Lottie.asset(
            'assets/lottie/34969-premium-icon-animation.json',
            height: 200,
            width: 200,
          ),
          Text(
            "Payment is successful.".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtMontserratRomanSemiBold18,
          )
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "Ok".tr,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtMontserratRomanSemiBold18,
        ),
      ),
      title: "Payment Successful",
    );
  }
}
