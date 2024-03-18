import 'package:mindweave/core/app_export.dart';

import '../presentation/bottom_nav/controller/discover_container_controller.dart';
import '../presentation/prompt_screen/controller/prompt_controller.dart';
import '../service/dialog_controller.dart';
import '../service/image_controller.dart';
import '../service/payment_controller.dart';
import '../service/promt_controller.dart';
import '../service/user_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DialogController());
    Get.put(BottomNavController());
    Get.put(PaymentController());
    Get.put(ImageController());
    Get.put(PromtController());
    Get.put(PromptWidgetController());
    Get.put(UserController());
  }
}
