import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../service/dialog_controller.dart';
import '../../../widgets/custom_text_form_field.dart';

class ProfileController extends GetxController {
  var user = FirebaseAuth.instance.currentUser!.obs;
  var dialogController = Get.find<DialogController>();
  final ImagePicker _picker = ImagePicker();
  var imagePath = "".obs;

  Future<bool> deleteUserDetails() async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final userRef = FirebaseFirestore.instance.collection('user').doc(
            userId,
          );

      final subcollections = ['fav', 'promts'];
      for (final subcollection in subcollections) {
        final querySnapshot = await userRef.collection(subcollection).get();
        final documents = querySnapshot.docs;
        for (final document in documents) {
          await document.reference.delete();
        }
      }
      await FirebaseFirestore.instance
          .collection('user')
          .doc(
            userId,
          )
          .delete();

      await FirebaseStorage.instance
          .refFromURL(user.value.photoURL ?? "")
          .delete();
    } catch (e) {
      log("deleteUserDetails" + e.toString());
    }

    return true;
  }

  Future<bool> deleteImagesInSubcollection() async {
    try {
      final user = FirebaseAuth.instance.currentUser!.uid;
      final subcollectionRef = FirebaseFirestore.instance
          .collection('user')
          .doc(user)
          .collection('fav');

      final querySnapshot = await subcollectionRef.get();
      final documents = querySnapshot.docs;
      for (final document in documents) {
        final imageUrl = document.data()['url'];

        if (imageUrl != null) {
          final storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
          try {
            await storageRef.delete();
          } catch (error) {
            print('Error deleting image: $error');
          }
        }
      }
    } catch (e) {
      log("deleteImagesInSubcollection" + e.toString());
    }

    return true;
  }

  getDetails() {
    user(FirebaseAuth.instance.currentUser!);
    update();
  }

  Future<String> profilePicChange() async {
    try {
      dialogController.loading(title: "Changing.");
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('user/${user.value.uid}/profilePic');
      await ref.putFile(
          File((await _picker.pickImage(source: ImageSource.gallery))!.path));
      await user.value.updatePhotoURL(await ref.getDownloadURL());
      await getDetails();
    } catch (e) {
      log(e.toString());
    } finally {
      Get.back();
    }
    return "";
  }

  Future<bool> deleteAccount() async {
    await Get.defaultDialog(
      title: "🛑 Delete Account 🛑",
      content: Text("Do you want to delete account?"),
      confirm: ElevatedButton(
          onPressed: () async {
            Get.back();
            dialogController.loading();
            try {
              await deleteImagesInSubcollection();
              await deleteUserDetails();
              await user.value.delete();
              Purchases.logOut();
              FirebaseAuth.instance.signOut();
              Get.offAllNamed(AppRoutes.splashScreen);
            } catch (e) {
              Get.back();
              Fluttertoast.showToast(
                  msg: e.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              log("deleteAccount" + e.toString());
            }
          },
          child: Text("Yes")),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("No"),
      ),
    );
    return true;
  }

  rename() {
    TextEditingController textEditingController =
        TextEditingController(text: user.value.displayName);
    Get.defaultDialog(
      title: "Rename",
      content: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
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
                0,
                0.5,
              ),
              end: Alignment(
                1,
                0.5,
              ),
              colors: [
                ColorConstant.tealA200,
                ColorConstant.purple100,
                ColorConstant.deepPurpleA200,
              ],
            ),
            corners: Corners(
              topLeft: Radius.circular(
                19,
              ),
              topRight: Radius.circular(
                19,
              ),
              bottomLeft: Radius.circular(
                19,
              ),
              bottomRight: Radius.circular(
                19,
              ),
            ),
            child: CustomTextFormField(
              width: getHorizontalSize(
                372,
              ),
              focusNode: FocusNode(),
              controller: textEditingController,
              hintText: "Rename".tr,
              variant: TextFormFieldVariant.Outline,
              shape: TextFormFieldShape.CircleBorder19,
              padding: TextFormFieldPadding.PaddingAll11,
              textInputAction: TextInputAction.done,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          "Cancel".tr,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtMontserratRomanSemiBold18,
        ),
      ),
      cancel: GestureDetector(
        onTap: () async {
          Get.back();
          dialogController.loading();
          try {
            await user.value.updateDisplayName(textEditingController.text);
            getDetails();
          } catch (e) {
            log(e.toString());
          } finally {
            Get.back();
          }
        },
        child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: getVerticalSize(
                    50,
                  ),
                  width: getHorizontalSize(
                    250,
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
                  "Rename".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratRomanSemiBold18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
