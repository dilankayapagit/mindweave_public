import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/presentation/Home_page/models/discover_model.dart';
import 'package:flutter/material.dart';

import '../../../model/image_model.dart';

class DiscoverController extends GetxController {
  DiscoverController(this.discoverModelObj);

  TextEditingController groupTwentyFiveController = TextEditingController();

  Rx<DiscoverModel> discoverModelObj;

  var imageModelList = <ImageModel>[].obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    groupTwentyFiveController.dispose();
  }
}
