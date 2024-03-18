import 'dart:convert';
import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/model/image_model.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../model/promts_model.dart';
import '../../../service/dialog_controller.dart';
import '../../../service/image_controller.dart';
import '../../../service/payment_controller.dart';
import '../../../service/promt_controller.dart';
import '../../../service/user_controller.dart';
import '../../bottom_nav/controller/discover_container_controller.dart';
import '../image_page.dart';

class PromptWidgetController extends GetxController {
  var dialogs = Get.find<DialogController>();
  var paymentController = Get.find<PaymentController>();
  var imageController = Get.find<ImageController>();
  var discoverContainerController = Get.find<BottomNavController>();

  var userController = Get.find<UserController>();
  var promtController = Get.find<PromtController>();
  var imageList = <ImageModel>[].obs;

  var dio = Dio();

  final openAI = OpenAI.instance.build(
    token: Constants.token,
    baseOption: HttpSetup(
      connectTimeout: const Duration(
        seconds: 20,
      ),
      sendTimeout: const Duration(
        seconds: 20,
      ),
      receiveTimeout: const Duration(
        seconds: 20,
      ),
    ),
    isLog: false,
  );

  // Future<bool> isNotAllowed() async {
  //   //await userController.getUser();
  //   if (paymentController.isSubscribe.value) {
  //     return false;
  //   }
  //   if ((userController.userCustomModel.value.maxPromts ?? 0) >
  //       (userController.userCustomModel.value.usedPromts ?? 0)) {
  //     return false;
  //   }
  //   discoverContainerController.changeBottomNav(2);
  //   Fluttertoast.showToast(
  //       msg: "Please Subscribe",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  //   return true;
  // }

  Future<bool> genarate(PromtsModel promtsModel) async {
    paymentController.isProMember();
    if (promtsModel.promt == "" || promtsModel.promt == null) {
      Fluttertoast.showToast(
          msg: "Promts is Empty",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return true;
    }

    var imageListTemp = <ImageModel>[];
    try {
      dialogs.loading();
      imageList([]);

      final request = GenerateImage(
        promtsModel.promt ?? "",
        promtsModel.imgCnt ?? 0,
        size: promtsModel.size,
        responseFormat: Format.url,
      );
      final response = await openAI.generateImage(request);
      promtController.addPromtLog(promtsModel);
      for (var element in response!.data!.toList()) {
        var name =
            "${element!.url.toString().split(Constants.imageUrlSplitter)[1].split("?")[0]}";
        imageListTemp.add(
          ImageModel(
            url: element.url,
            name: name,
            promt: promtsModel.promt,
            isFav: false,
            quality: promtsModel.size.toString(),
            id: createId(element.url ?? ""),
          ),
        );
      }
      imageList(imageListTemp);
      if (!paymentController.isSubscribe.value) {
        await paymentController.addImageContUsed();
      }
      Get.off(() => ImagePage());
    } catch (e) {
      Get.back();
      log(e.toString());
    } finally {
      update();
    }
    return true;
  }

  openImage(String path) {
    try {
      OpenFilex.open(
        path,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  download(ImageModel imageModel) async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }
    var path = "${(await getTemporaryDirectory()).path}/${imageModel.name}";
    log(path);
    try {
      dialogs.loading();
      await dio.download(
        imageModel.url ?? "",
        path,
      );
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

    openImage(path);
  }

  String createId(String url) {
    var appleInBytes = utf8.encode(url);
    String value = sha256.convert(appleInBytes).toString();
    //log(value.toString());
    return value;
  }

  dialogPic(ImageModel imageModel, {bool isGenarte = false}) {
    Get.defaultDialog(
      //backgroundColor: Colors.transparent,
      // titlePadding: const EdgeInsets.all(0),
      contentPadding: const EdgeInsets.all(0),

      title: "",
      titleStyle: TextStyle(
        fontSize: 0,
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              // height: getVerticalSize(
              //   size.height * 0.6,
              // ),
              // width: getHorizontalSize(
              //   size.width * 0.9,
              // ),
              child: CustomImageView(
                url: imageModel.url ?? "",
                fit: BoxFit.scaleDown,
                // height: getVerticalSize(
                //   size.height * 0.6,
                // ),
                // width: getHorizontalSize(
                //   size.width * 0.9,
                // ),
                radius: BorderRadius.circular(
                  getHorizontalSize(
                    21,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(imageModel.promt ?? "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 10,
                style: AppStyle.txtMontserratRomanSemiBold12
                    .copyWith(fontSize: 14, color: Colors.grey)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: FaIcon(
                    FontAwesomeIcons.circleXmark,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                if (!isGenarte)
                  GestureDetector(
                    onTap: () async {
                      await imageController.removeFavourite(imageModel);
                      Get.back();
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: ColorConstant.mainPurpleColor,
                    ),
                  ),
                if (!isGenarte)
                  SizedBox(
                    width: 30,
                  ),
                GestureDetector(
                  onTap: () {
                    download(imageModel);
                  },
                  child: CustomImageView(
                    svgPath: ImageConstant.imgArrowdown,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
