import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mindweave/model/payment_model.dart';
import 'package:mindweave/service/dialog_controller.dart';
import 'package:mindweave/service/user_controller.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PaymentController extends GetxController {
  var dialogController = Get.find<DialogController>();
  var isSubscribe = false.obs;
  final packs = <String>["", "", ""].obs;
  var userController = Get.put(UserController());
  var isPro = false.obs;

  void isProMember() {
    if (isSubscribe.value) {
      isPro(true);
      update();
      return;
    } else if ((userController.userCustomModel.value.isLife ?? false)) {
      isPro(true);
      update();
      return;
    } else if ((userController.userCustomModel.value.maxPromts ?? 0) >=
        (userController.userCustomModel.value.usedPromts ?? 0)) {
      isPro(true);
      update();
    } else {
      isPro(false);
      update();
    }
  }

  Future<bool> addLifetime() async {
    try {
      var user = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("user").doc(user).set(
        {
          "isLife": true,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(
          merge: true,
        ),
      );
      await userController.getUser();
      isProMember();
    } catch (e) {
      log("message$e");
    }
    update();
    return true;
  }

  Future<bool> addImageContUsed() async {
    try {
      var user = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("user").doc(user).set(
        {
          "usedPromts":
              (userController.userCustomModel.value.usedPromts ?? 0) + 1,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(
          merge: true,
        ),
      );
      await userController.getUser();
      isProMember();
    } catch (e) {
      log("message$e");
    }
    update();
    return true;
  }

  Future<bool> imageContAddMax() async {
    try {
      var user = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection("user").doc(user).set(
        {
          "maxPromts":
              (userController.userCustomModel.value.maxPromts ?? 0) + 20,
          "updatedAt": FieldValue.serverTimestamp(),
        },
        SetOptions(
          merge: true,
        ),
      );
      await userController.getUser();
      isProMember();
    } catch (e) {
      log("message$e");
    }

    update();
    return true;
  }

  Future<bool> makePurchases(int index, String id) async {
    try {
      var offerings = await Purchases.getOfferings();
      final package = offerings.current!.availablePackages;
      for (var pack in package) {
        if (pack.storeProduct.identifier == id) {
          await Purchases.purchasePackage(pack);
          break;
        }
      }

      if (index == 1) {
        addLifetime();
      }
      if (index == 2) {
        imageContAddMax();
      }
      await getSubscribeStatus();
      dialogController.paymentSuccesfulDialog();
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        log("message$e");
      }
    } catch (e) {
      log("message$e");
    } finally {
      update();
    }
    return true;
  }

  Future<bool> getOfferings() async {
    try {
      final packsTemp = <String>[];
      var offerings = await Purchases.getOfferings();
      final package = offerings.current!.availablePackages;
      for (var pack in package.toList()) {
        packsTemp.add(pack.storeProduct.priceString);
      }
      packs(packsTemp);
    } catch (e) {
      log("getOfferings$e");
    }

    update();
    return true;
  }

  Future<bool> getSubscribeStatus() async {
    try {
      getOfferings();
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      if (customerInfo.entitlements.all["mind"] != null &&
          customerInfo.entitlements.all["mind"]!.isActive) {
        isSubscribe(true);
      } else {
        isSubscribe(false);
      }
    } catch (e) {
      log("message$e");
    } finally {
      isProMember();
      update();
    }
    return isSubscribe.value;
  }

  Future<void> restore() async {
    dialogController.loading(title: "Restoring...");
    try {
      await Purchases.restorePurchases();
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
    }
  }

  static Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration configuration;

    if (Platform.isAndroid) {
      configuration =
          PurchasesConfiguration("");
    } else {
      configuration =
          PurchasesConfiguration("");
    }
    await Purchases.configure(configuration);
  }

  static List<PaymentModel> payModelList = [
    PaymentModel(
      payName: "Mindweave Monthly",
      payId: "mind_m",
      price: "\$4.99",
      isSubscription: true,
      packs: [
        "Unlimited Prompts",
        "Unlimited Downloads",
        "lbl_offline_access".tr,
      ],
    ),
    PaymentModel(
      payName: "Mindweave Lifetime",
      payId: "mind_l",
      price: "\$39",
      isSubscription: true,
      packs: [
        "Unlimited Prompts",
        "Unlimited Downloads",
        "lbl_offline_access".tr,
      ],
    ),
    PaymentModel(
      payName: "Mindweave 20 Prompts",
      payId: "mind_20_img",
      price: "\$9.99",
      isSubscription: false,
      packs: [
        "20 Prompts",
        "Unlimited Downloads",
        "lbl_offline_access".tr,
      ],
    ),
    PaymentModel(
      payName: "Mindweave Free",
      payId: "mind_f",
      price: "",
      isSubscription: false,
      packs: [
        "",
        "",
      ],
    ),
  ];
}
