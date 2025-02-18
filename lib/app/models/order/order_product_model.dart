import 'package:partner_hub/app/models/order/modifier_model.dart';

class OrderProductModel {
  final String? uuid;
  final String? title;
  final num? singlePrice;
  int? qty;
  final num? tax;
  final String? taxType;
  final String? categoryUuid;
  final String? brandUuid;
  final String? departmentUuid;
  final List<ModifierModel> modifiers;
  int localId;
  int? productTypeId;
  String? groupUuid;
  double? weight;

  double get totalPrice =>
      (qty! * singlePrice!) +
      modifiers.fold(
          0, (previousValue, element) => previousValue + element.totalPrice);

  OrderProductModel({
    this.uuid,
    this.title,
    this.singlePrice,
    this.qty,
    this.tax,
    this.taxType,
    this.categoryUuid,
    this.brandUuid,
    this.departmentUuid,
    this.modifiers = const [],
    required this.localId,
    this.productTypeId,
    this.groupUuid,
    this.weight,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    returnqty() {
      if (json['qty'] is double) {
        return int.parse(
            double.parse(json['qty'].toString()).truncate().toString());
      } else {
        return json['qty'];
      }
    }

    return OrderProductModel(
      uuid: json['uuid'],
      title: json['title'],
      singlePrice: json['singlePrice'],
      qty: returnqty(),
      tax: json['tax'],
      taxType: json['taxType'],
      categoryUuid: json['categoryUuid'],
      brandUuid: json['brandUuid'],
      departmentUuid: json['departmentUuid'],
      localId: json['localId'],
      productTypeId: json['productTypeId'],
      groupUuid: json['groupUuid'],
      weight: json['weight'],
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((modifier) => ModifierModel.fromJson(modifier))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'title': title,
      'singlePrice': singlePrice,
      'qty': qty,
      'tax': tax,
      'taxType': taxType,
      'categoryUuid': categoryUuid,
      'brandUuid': brandUuid,
      'departmentUuid': departmentUuid,
      'localId': localId,
      'productTypeId': productTypeId,
      'groupUuid': groupUuid,
      'weight': weight,
      'modifiers': modifiers.map((modifier) => modifier.toJson()).toList(),
    };
  }
}
