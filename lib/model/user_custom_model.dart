// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCustomModel {
  final String? userId;
  final String? name;
  final String? email;
  final String? pw;
  final bool? isLife;

  final String? favCnt;
  final int? usedPromts;

  final int? maxPromts;

  final dynamic? updatedAt;
  final dynamic? createdAt;
  UserCustomModel({
    this.userId,
    this.name,
    this.email,
    this.pw,
    this.isLife,
    this.favCnt,
    this.usedPromts,
    this.maxPromts,
    this.updatedAt,
    this.createdAt,
  });

  UserCustomModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? pw,
    bool? isLife,
    String? favCnt,
    int? usedPromts,
    int? maxPromts,
    dynamic? updatedAt,
    dynamic? createdAt,
  }) {
    return UserCustomModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      pw: pw ?? this.pw,
      isLife: isLife ?? this.isLife,
      favCnt: favCnt ?? this.favCnt,
      usedPromts: usedPromts ?? this.usedPromts,
      maxPromts: maxPromts ?? this.maxPromts,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'email': email,
      'pw': pw,
      'isLife': isLife,
      'favCnt': favCnt,
      'usedPromts': usedPromts,
      'maxPromts': maxPromts,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory UserCustomModel.fromMap(Map<String, dynamic> map) {
    return UserCustomModel(
      userId: map['userId'] != null ? map['userId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      pw: map['pw'] != null ? map['pw'] as String : null,
      isLife: map['isLife'] != null ? map['isLife'] as bool : null,
      favCnt: map['favCnt'] != null ? map['favCnt'] as String : null,
      usedPromts: map['usedPromts'] != null ? map['usedPromts'] as int : null,
      maxPromts: map['maxPromts'] != null ? map['maxPromts'] as int : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as dynamic : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCustomModel.fromJson(String source) =>
      UserCustomModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserCustomModel(userId: $userId, name: $name, email: $email, pw: $pw, isLife: $isLife, favCnt: $favCnt, usedPromts: $usedPromts, maxPromts: $maxPromts, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserCustomModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.name == name &&
      other.email == email &&
      other.pw == pw &&
      other.isLife == isLife &&
      other.favCnt == favCnt &&
      other.usedPromts == usedPromts &&
      other.maxPromts == maxPromts &&
      other.updatedAt == updatedAt &&
      other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      pw.hashCode ^
      isLife.hashCode ^
      favCnt.hashCode ^
      usedPromts.hashCode ^
      maxPromts.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode;
  }
}
