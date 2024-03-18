import 'package:mindweave/core/app_export.dart';
import 'package:mindweave/presentation/bottom_nav/models/discover_container_model.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavController extends GetxController {
  Rx<DiscoverContainerModel> discoverContainerModelObj =
      DiscoverContainerModel().obs;

  var persistentTabController = PersistentTabController(initialIndex: 0).obs;

  changeBottomNav(int num) {
    persistentTabController.value.jumpToTab(num);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {}
}
