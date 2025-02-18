// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DiscountTypeModel {
  int? id;
  String? name;
  String? uuid;
  DiscountTypeModel({
    this.id,
    this.name,
    this.uuid,
  });

  DiscountTypeModel copyWith({
    int? id,
    String? name,
    String? uuid,
  }) {
    return DiscountTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uuid': uuid,
    };
  }

  factory DiscountTypeModel.fromMap(Map<String, dynamic> map) {
    return DiscountTypeModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountTypeModel.fromJson(String source) =>
      DiscountTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DiscountTypeModel(id: $id, name: $name, uuid: $uuid)';

  @override
  bool operator ==(covariant DiscountTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.uuid == uuid;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ uuid.hashCode;
}
