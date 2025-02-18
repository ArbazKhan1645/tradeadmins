// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductBulkPriceModel {
  int? priceLevel;
  int? productUUid;
  String? price;
  ProductBulkPriceModel({
    this.priceLevel,
    this.productUUid,
    this.price,
  });

  ProductBulkPriceModel copyWith({
    int? priceLevel,
    int? productUUid,
    String? price,
  }) {
    return ProductBulkPriceModel(
      priceLevel: priceLevel ?? this.priceLevel,
      productUUid: productUUid ?? this.productUUid,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'priceLevel': priceLevel,
      'productUUid': productUUid,
      'price': price,
    };
  }

  factory ProductBulkPriceModel.fromMap(Map<String, dynamic> map) {
    return ProductBulkPriceModel(
      priceLevel: map['priceLevel'] != null ? map['priceLevel'] as int : null,
      productUUid:
          map['productUUid'] != null ? map['productUUid'] as int : null,
      price: map['price'] != null ? map['price'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductBulkPriceModel.fromJson(String source) =>
      ProductBulkPriceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductBulkPriceModel(priceLevel: $priceLevel, productUUid: $productUUid, price: $price)';

  @override
  bool operator ==(covariant ProductBulkPriceModel other) {
    if (identical(this, other)) return true;

    return other.priceLevel == priceLevel &&
        other.productUUid == productUUid &&
        other.price == price;
  }

  @override
  int get hashCode =>
      priceLevel.hashCode ^ productUUid.hashCode ^ price.hashCode;
}
