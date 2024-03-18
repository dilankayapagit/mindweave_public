import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mindweave/model/promts_model.dart';

class PromtController extends GetxController {
  var promtsList = <PromtsModel>[].obs;

  Future<bool> getPromts() async {
    var promtsTemp = <PromtsModel>[];

    try {
      var user = FirebaseAuth.instance.currentUser!;

      var firebaseFirestore = FirebaseFirestore.instance
          .collection("user/${user.uid}/promts")
          .orderBy("createdAt", descending: true);
      await firebaseFirestore.get().then((value) {
        for (var doc in value.docs) {
          var data = doc.data();
          promtsTemp.add(PromtsModel.fromMap(data));
        }
      });
    } catch (e) {
      log("getPromts " + e.toString());
    }

    promtsList(promtsTemp);
    update();
    return true;
  }

  Future<bool> addPromtLog(
    PromtsModel promtsModel,
  ) async {
    var user = FirebaseAuth.instance.currentUser!;

    var firebaseFirestore =
        FirebaseFirestore.instance.collection("user/${user.uid}/promts");
    var promtId = createId(promtsModel.promt ?? "");
    await firebaseFirestore.doc(promtId).set(
          promtsModel
              .copyWith(
                  size: "",
                  promtId: promtId,
                  createdAt: FieldValue.serverTimestamp())
              .toMap(),
          SetOptions(
            merge: true,
          ),
        );
    getPromts();
    return true;
  }

  String createId(String url) {
    var appleInBytes = utf8.encode(url);
    String value = sha256.convert(appleInBytes).toString();
    //log(value.toString());
    return value;
  }
}
