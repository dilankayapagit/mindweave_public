import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../model/image_model.dart';
import 'dialog_controller.dart';

class ImageController extends GetxController {
  var imageModelList = <ImageModel>[].obs;
  var imageModelSearchList = <ImageModel>[].obs;
  var txtController = TextEditingController().obs;
  var dialogs = Get.find<DialogController>();
  var dio = Dio();

  Future<bool> getSearch() async {
    var imageModelTemp = <ImageModel>[];
    if (txtController.value.text != "") {
      for (var element in imageModelSearchList) {
        if (element.promt!
            .toLowerCase()
            .contains(txtController.value.text.toLowerCase())) {
          imageModelTemp.add(element);
        }
      }
    } else {
      imageModelTemp = imageModelList;
    }

    imageModelSearchList(imageModelTemp);
    update();
    return true;
  }

  Future<bool> getFav() async {
    var imageModelTemp = <ImageModel>[];

    try {
      var user = FirebaseAuth.instance.currentUser!;

      var firebaseFirestore = FirebaseFirestore.instance
          .collection("user/${user.uid}/fav")
          .orderBy("updatedAt", descending: true);
      await firebaseFirestore.get().then((value) {
        for (var doc in value.docs) {
          var data = doc.data();
          imageModelTemp.add(ImageModel.fromMap(data));
        }
      });
    } catch (e) {
      log("getFav " + e.toString());
    }

    imageModelList(imageModelTemp);
    getSearch();
    update();
    return true;
  }

  Future<bool> removeFavourite(
    ImageModel imageModel,
  ) async {
    bool isRemoved = false;
    await Get.defaultDialog(
      title: "Remove",
      content: Text("Do you want to remove?"),
      confirm: ElevatedButton(
          onPressed: () {
            isRemoved = true;
            try {
              var user = FirebaseAuth.instance.currentUser!;

              var firebaseFirestore =
                  FirebaseFirestore.instance.collection("user/${user.uid}/fav");
              firebaseFirestore.doc(imageModel.id).delete();
            } catch (e) {
              log("removeFavourite " + e.toString());
            }
            getFav();
            Get.back();
          },
          child: Text("Yes")),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("No"),
      ),
    );
    return isRemoved;
  }

  Future<bool> addFavourite(
    ImageModel imageModel,
  ) async {
    try {
      var user = FirebaseAuth.instance.currentUser!;
      var firebaseFirestore =
          FirebaseFirestore.instance.collection("user/${user.uid}/fav");
      await firebaseFirestore.doc(imageModel.id).set(
          imageModel
              .copyWith(
                isFav: true,
                updatedAt: FieldValue.serverTimestamp(),
              )
              .toMap(),
          SetOptions(
            merge: true,
          ));
    } catch (e) {
      log("addFavourite " + e.toString());
    }
    getFav();
    update();
    return true;
  }

  Future<String> uploadFirebaseStorage(ImageModel imageModel) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('user/${user!.uid}/${imageModel.name}');
      await ref.putFile(File(imageModel.path ?? ""));
      await addFavourite(imageModel.copyWith(url: await ref.getDownloadURL()));
    } catch (e) {
      log(e.toString());
    }
    return "";
  }

  Future<bool> downloadAndAddFav(ImageModel imageModel) async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    dialogs.loading(title: "Downloading & Adding to Favourite.");

    var path = "${(await getTemporaryDirectory()).path}/${imageModel.name}}";
    try {
      await dio.download(
        imageModel.url ?? "",
        path,
      );
      await uploadFirebaseStorage(imageModel.copyWith(path: path));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Server Error : ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      log(e.toString());
    } finally {
      Get.back();
    }
    return true;
  }
}
