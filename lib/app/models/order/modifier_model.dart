class ModifierModel {
  final int? id;
  final String? title;
  final num? singlePrice;
  int? qty;
  String? uuid;
  int localId;
  double? tax;
  String? productUuid;

  ModifierModel({
    this.id,
    this.title,
    this.singlePrice,
    this.qty,
    this.uuid,
    required this.localId,
    this.tax,
    this.productUuid,
  });

  num get totalPrice => singlePrice! * qty!;

  factory ModifierModel.fromJson(Map<String, dynamic> json) {
    returnqty() {
      if (json['qty'] is double) {
        return int.parse(
            double.parse(json['qty'].toString()).truncate().toString());
      } else {
        return json['qty'];
      }
    }

    return ModifierModel(
      id: json['id'],
      title: json['title'],
      singlePrice: json['singlePrice'],
      qty: returnqty(),
      uuid: json['uuid'],
      localId: json['localId'],
      tax: json['tax'],
      productUuid: json['productUuid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'singlePrice': singlePrice,
      'qty': qty,
      'uuid': uuid,
      'localId': localId,
      'tax': tax,
      'productUuid': productUuid,
    };
  }
}
