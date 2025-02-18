// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ServiceChargesAndDiscountModel {
  int? id;
  String? uuid;
  String? name;
  int? location_id;
  double? amount;
  int? discount_type_id;
  ServiceChargesAndDiscountModel({
    this.id,
    this.uuid,
    this.name,
    this.location_id,
    this.amount,
    this.discount_type_id,
  });

  ServiceChargesAndDiscountModel copyWith({
    int? id,
    String? uuid,
    String? name,
    int? location_id,
    double? amount,
    int? discount_type_id,
  }) {
    return ServiceChargesAndDiscountModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      location_id: location_id ?? this.location_id,
      amount: amount ?? this.amount,
      discount_type_id: discount_type_id ?? this.discount_type_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'name': name,
      'location_id': location_id,
      'amount': amount,
      'discount_type_id': discount_type_id,
    };
  }

  factory ServiceChargesAndDiscountModel.fromMap(Map<String, dynamic> map) {
    return ServiceChargesAndDiscountModel(
      id: map['id'] != null ? map['id'] as int : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      location_id:
          map['location_id'] != null ? map['location_id'] as int : null,
      amount:
          map['amount'] != null ? double.parse(map['amount'].toString()) : null,
      discount_type_id: map['discount_type_id'] != null
          ? map['discount_type_id'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceChargesAndDiscountModel.fromJson(String source) =>
      ServiceChargesAndDiscountModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceChargesModel(id: $id, uuid: $uuid, name: $name, location_id: $location_id, amount: $amount, discount_type_id: $discount_type_id)';
  }

  @override
  bool operator ==(covariant ServiceChargesAndDiscountModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.name == name &&
        other.location_id == location_id &&
        other.amount == amount &&
        other.discount_type_id == discount_type_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        name.hashCode ^
        location_id.hashCode ^
        amount.hashCode ^
        discount_type_id.hashCode;
  }
}
