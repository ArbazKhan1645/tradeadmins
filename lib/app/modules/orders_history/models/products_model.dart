// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String? name;
  int? qty;
  int? id;
  bool? isSelected;

  ProductModel({
    this.name,
    this.qty,
    this.id,
    this.isSelected = false,
  });

  ProductModel copyWith({
    String? name,
    int? qty,
    int? id,
    List<int>? pricelevelIds,
  }) {
    return ProductModel(
      name: name ?? this.name,
      qty: qty ?? this.qty,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'qty': qty,
      'id': id,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] != null ? map['name'] as String : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, qty: $qty, id: $id,)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.qty == qty && other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ qty.hashCode ^ id.hashCode;
  }
}
