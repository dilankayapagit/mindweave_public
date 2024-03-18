import 'package:firebase_auth/firebase_auth.dart';
import 'package:mindweave/core/app_export.dart';

import '../../../service/user_controller.dart';

class SplashScreenController extends GetxController {
  var userController = Get.put(UserController());
  startup() async {
   
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userController.getUser();
      await Future.delayed(const Duration(milliseconds: 3000), () {});

      Get.offAllNamed(AppRoutes.bottomNav);
      return;
    }
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAllNamed(AppRoutes.getStartedScreen);
    });
  }

  @override
  void onReady() {
    super.onReady();
    startup();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
