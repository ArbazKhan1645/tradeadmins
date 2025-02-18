// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class ModifiersModel {
  int? id;
  String? name;
  String? uuid;
  num? cost_price;
  num? sale_price;
  bool? isselected;
  String? tax_uuid;
  String? tax_type_uuid;
  int? quantity;
  ModifiersModel({
    this.isselected,
    this.id,
    this.name,
    this.uuid,
    this.quantity,
    this.cost_price,
    this.tax_type_uuid,
    this.sale_price,
    this.tax_uuid,
  });

  num get totalPrice => sale_price! * quantity!;

  ModifiersModel copyWith({
    int? id,
    String? name,
    num? cost_price,
    String? tax_type_uuid,
    num? sale_price,
    String? tax_uuid,
  }) {
    return ModifiersModel(
      id: id ?? this.id,
      tax_type_uuid: tax_type_uuid ?? this.tax_type_uuid,
      name: name ?? this.name,
      cost_price: cost_price ?? this.cost_price,
      sale_price: sale_price ?? this.sale_price,
      tax_uuid: tax_uuid ?? this.tax_uuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tax_type_uuid': tax_type_uuid,
      'name': name,
      'cost_price': cost_price,
      'sale_price': sale_price,
      'tax_uuid': tax_uuid,
    };
  }

  factory ModifiersModel.fromMap(Map<String, dynamic> map) {
    return ModifiersModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] ?? '',
      isselected: false,
      tax_type_uuid: map['tax_type_uuid'] ?? '',
      quantity: 1,
      uuid: map['uuid'] ?? '',
      cost_price: map['cost_price'] ?? 0.0,
      sale_price: map['sale_price'] ?? 0.0,
      tax_uuid: map['tax_uuid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifiersModel.fromJson(String source) =>
      ModifiersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModifiersModel(id: $id, name: $name, cost_price: $cost_price, sale_price: $sale_price, tax: $tax_uuid , tax_type_uuid: $tax_type_uuid)';
  }

  @override
  bool operator ==(covariant ModifiersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.tax_type_uuid == tax_type_uuid &&
        other.name == name &&
        other.cost_price == cost_price &&
        other.sale_price == sale_price &&
        other.tax_uuid == tax_uuid;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        tax_type_uuid.hashCode ^
        cost_price.hashCode ^
        sale_price.hashCode ^
        tax_uuid.hashCode;
  }
}
