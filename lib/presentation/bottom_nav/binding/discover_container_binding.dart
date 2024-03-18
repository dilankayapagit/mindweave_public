import '../controller/discover_container_controller.dart';
import 'package:get/get.dart';

class DiscoverContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}
