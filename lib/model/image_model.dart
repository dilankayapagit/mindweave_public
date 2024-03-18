// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ImageModel {
  final String? id;
  final String? quality;

  final String? url;
  final String? name;
  final String? promt;
  final bool isFav;
    final String? path;

   final dynamic? updatedAt;
  ImageModel({
    this.id,
    this.quality,
    this.url,
    this.name,
    this.promt,
    required this.isFav,
    this.path,
    this.updatedAt,
  });


 

  ImageModel copyWith({
    String? id,
    String? quality,
    String? url,
    String? name,
    String? promt,
    bool? isFav,
    String? path,
    dynamic? updatedAt,
  }) {
    return ImageModel(
      id: id ?? this.id,
      quality: quality ?? this.quality,
      url: url ?? this.url,
      name: name ?? this.name,
      promt: promt ?? this.promt,
      isFav: isFav ?? this.isFav,
      path: path ?? this.path,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quality': quality,
      'url': url,
      'name': name,
      'promt': promt,
      'isFav': isFav,
      'path': path,
      'updatedAt': updatedAt,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] != null ? map['id'] as String : null,
      quality: map['quality'] != null ? map['quality'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      promt: map['promt'] != null ? map['promt'] as String : null,
      isFav: map['isFav'] as bool,
      path: map['path'] != null ? map['path'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ImageModel(id: $id, quality: $quality, url: $url, name: $name, promt: $promt, isFav: $isFav, path: $path, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant ImageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.quality == quality &&
      other.url == url &&
      other.name == name &&
      other.promt == promt &&
      other.isFav == isFav &&
      other.path == path &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      quality.hashCode ^
      url.hashCode ^
      name.hashCode ^
      promt.hashCode ^
      isFav.hashCode ^
      path.hashCode ^
      updatedAt.hashCode;
  }
}
