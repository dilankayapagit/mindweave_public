import 'package:get/get.dart';
import 'discover_item_model.dart';

class DiscoverModel {
  RxList<DiscoverItemModel> discoverItemList =
      RxList.generate(12, (index) => DiscoverItemModel());
}
