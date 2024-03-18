import 'package:get/get.dart';
import 'payment_two_item_model.dart';

class PaymentTwoModel {
  RxList<PaymentTwoItemModel> paymentTwoItemList =
      RxList.generate(2, (index) => PaymentTwoItemModel());
}
