import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/service/promt_controller.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../model/user_custom_model.dart';

class UserController extends GetxController {
  var userCustomModel = UserCustomModel().obs;

  var promtController = Get.put(PromtController());

  Future<bool> getUser() async {
    try {
      var user = FirebaseAuth.instance.currentUser!;

      var firebaseFirestore = FirebaseFirestore.instance.collection("user");

      await promtController.getPromts();
      await firebaseFirestore.doc(user.uid).get().then((value) {
        userCustomModel(
            UserCustomModel.fromMap(value.data() as Map<String, dynamic>));
      });
    } catch (e) {
      log(e.toString());
    }

    update();
    return true;
  }

  Future<bool> createUser({UserCustomModel? userCustomModel}) async {
    try {
      bool isHas = false;
      await Future.delayed(const Duration(milliseconds: 1000), () {});
      var user = FirebaseAuth.instance.currentUser!;
      var firebaseFirestore = FirebaseFirestore.instance.collection("user");
      await firebaseFirestore.doc(user.uid).get().then((value) {
        if (value.exists) {
          isHas = true;
          return;
        }
      });

      if (!isHas) {
        if (user.isAnonymous) {
          await firebaseFirestore.doc(user.uid).set(
                UserCustomModel(
                  name: "",
                  email: "",
                  isLife: false,
                  maxPromts: 2,
                  usedPromts: 0,
                  userId: user.uid,
                  updatedAt: FieldValue.serverTimestamp(),
                  createdAt: FieldValue.serverTimestamp(),
                ).toMap(),
                SetOptions(merge: true),
              );
        } else if (userCustomModel == null) {
          await firebaseFirestore.doc(user.uid).set(
                UserCustomModel(
                  name: "",
                  email: user.email,
                  maxPromts: 2,
                  isLife: false,
                  usedPromts: 0,
                  userId: user.uid,
                  updatedAt: FieldValue.serverTimestamp(),
                  createdAt: FieldValue.serverTimestamp(),
                ).toMap(),
                SetOptions(merge: true),
              );
        } else {
          await firebaseFirestore.doc(user.uid).set(
                UserCustomModel(
                  name: userCustomModel.name,
                  maxPromts: 2,
                  usedPromts: 0,
                  isLife: false,
                  email: userCustomModel.email,
                  userId: user.uid,
                  updatedAt: FieldValue.serverTimestamp(),
                  createdAt: FieldValue.serverTimestamp(),
                ).toMap(),
                SetOptions(merge: true),
              );
        }

        if (!(user.isAnonymous)) {
          user.sendEmailVerification();
        }
        LogInResult result = await Purchases.logIn(user.uid);
        log(result.customerInfo.toString());
        await user.updateDisplayName(userCustomModel!.name);
      }
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      getUser();
    }
  }
}
