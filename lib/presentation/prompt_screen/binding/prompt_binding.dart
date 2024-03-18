import '../controller/prompt_controller.dart';
import 'package:get/get.dart';

class PromptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PromptWidgetController());
  }
}
