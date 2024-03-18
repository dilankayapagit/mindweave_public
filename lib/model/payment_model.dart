// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class PaymentModel {
  final String? payId;
  final String? payName;
  final String? price;
  final bool? isSubscription;

  final List<String>? packs;
  PaymentModel({
    this.payId,
    this.payName,
    this.price,
    this.isSubscription,
    this.packs,
  });

  PaymentModel copyWith({
    String? payId,
    String? payName,
    String? price,
    bool? isSubscription,
    List<String>? packs,
  }) {
    return PaymentModel(
      payId: payId ?? this.payId,
      payName: payName ?? this.payName,
      price: price ?? this.price,
      isSubscription: isSubscription ?? this.isSubscription,
      packs: packs ?? this.packs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'payId': payId,
      'payName': payName,
      'price': price,
      'isSubscription': isSubscription,
      'packs': packs,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      payId: map['payId'] != null ? map['payId'] as String : null,
      payName: map['payName'] != null ? map['payName'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      isSubscription:
          map['isSubscription'] != null ? map['isSubscription'] as bool : null,
      packs: map['packs'] != null
          ? List<String>.from((map['packs'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(payId: $payId, payName: $payName, price: $price, isSubscription: $isSubscription, packs: $packs)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;

    return other.payId == payId &&
        other.payName == payName &&
        other.price == price &&
        other.isSubscription == isSubscription &&
        listEquals(other.packs, packs);
  }

  @override
  int get hashCode {
    return payId.hashCode ^
        payName.hashCode ^
        price.hashCode ^
        isSubscription.hashCode ^
        packs.hashCode;
  }
}
