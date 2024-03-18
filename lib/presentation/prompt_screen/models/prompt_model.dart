import 'package:get/get.dart';
import 'prompt_item_model.dart';

class PromptModel {
  RxList<PromptItemModel> promptItemList =
      RxList.generate(4, (index) => PromptItemModel());
}
