// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PromtsModel {
  final String? promtId;
  final String? promt;
  final int? imgCnt;


  final dynamic? size;

  final dynamic? createdAt;
  PromtsModel({
    this.promtId,
    this.promt,
    this.imgCnt,
    this.size,
    this.createdAt,
  });

  

  PromtsModel copyWith({
    String? promtId,
    String? promt,
    int? imgCnt,
    dynamic? size,
    dynamic? createdAt,
  }) {
    return PromtsModel(
      promtId: promtId ?? this.promtId,
      promt: promt ?? this.promt,
      imgCnt: imgCnt ?? this.imgCnt,
      size: size ?? this.size,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'promtId': promtId,
      'promt': promt,
      'imgCnt': imgCnt,
      'size': size,
      'createdAt': createdAt,
    };
  }

  factory PromtsModel.fromMap(Map<String, dynamic> map) {
    return PromtsModel(
      promtId: map['promtId'] != null ? map['promtId'] as String : null,
      promt: map['promt'] != null ? map['promt'] as String : null,
      imgCnt: map['imgCnt'] != null ? map['imgCnt'] as int : null,
      size: map['size'] != null ? map['size'] as dynamic : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PromtsModel.fromJson(String source) => PromtsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PromtsModel(promtId: $promtId, promt: $promt, imgCnt: $imgCnt, size: $size, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant PromtsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.promtId == promtId &&
      other.promt == promt &&
      other.imgCnt == imgCnt &&
      other.size == size &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return promtId.hashCode ^
      promt.hashCode ^
      imgCnt.hashCode ^
      size.hashCode ^
      createdAt.hashCode;
  }
}
