// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'order_product_model.dart'; // Importing the ProductModel if it's defined in a separate file

class OrderModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? uuid;
  List<OrderProductModel>? products;
  String? orderTrackNumber;
  String? transactionUuid;
  int? orderTicketStatusId;
  int? saleChannelId;
  String? customerUuid;
  String? serviceId;
  int? orderStatusId;
  double? totalAmount;
  String? serviceCharges;
  String? discount;
  double? tax;
  double? tipsAmount;
  String? dineInTableUuid;
  int? orderTypeId;
  String? orderServiceTypeUuid;
  String? batchReportUuid;
  int? terminalId;
  String? staffUUId;
  int? locationId;
  OrderModel({
    this.id,
    this.createdAt,
    this.staffUUId,
    this.updatedAt,
    this.uuid,
    this.products,
    this.orderTrackNumber,
    this.transactionUuid,
    this.orderTicketStatusId,
    this.saleChannelId,
    this.customerUuid,
    this.serviceId,
    this.orderStatusId,
    this.totalAmount,
    this.serviceCharges,
    this.discount,
    this.tax,
    this.tipsAmount,
    this.dineInTableUuid,
    this.orderTypeId,
    this.orderServiceTypeUuid,
    this.batchReportUuid,
    this.terminalId,
    this.locationId,
  });

  OrderModel copyWith({
    int? id,
    String? createdAt,
    String? updatedAt,
    String? uuid,
    List<OrderProductModel>? products,
    String? orderTrackNumber,
    String? transactionUuid,
    int? orderTicketStatusId,
    int? saleChannelId,
    String? customerUuid,
    String? serviceId,
    int? orderStatusId,
    double? totalAmount,
    String? serviceCharges,
    String? discount,
    double? tax,
    double? tipsAmount,
    String? staffUUId,
    String? dineInTableUuid,
    int? orderTypeId,
    String? orderServiceTypeUuid,
    String? batchReportUuid,
    int? terminalId,
    int? locationId,
  }) {
    return OrderModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      staffUUId: staffUUId ?? this.staffUUId,
      uuid: uuid ?? this.uuid,
      products: products ?? this.products,
      orderTrackNumber: orderTrackNumber ?? this.orderTrackNumber,
      transactionUuid: transactionUuid ?? this.transactionUuid,
      orderTicketStatusId: orderTicketStatusId ?? this.orderTicketStatusId,
      saleChannelId: saleChannelId ?? this.saleChannelId,
      customerUuid: customerUuid ?? this.customerUuid,
      serviceId: serviceId ?? this.serviceId,
      orderStatusId: orderStatusId ?? this.orderStatusId,
      totalAmount: totalAmount ?? this.totalAmount,
      serviceCharges: serviceCharges ?? this.serviceCharges,
      discount: discount ?? this.discount,
      tax: tax ?? this.tax,
      tipsAmount: tipsAmount ?? this.tipsAmount,
      dineInTableUuid: dineInTableUuid ?? this.dineInTableUuid,
      orderTypeId: orderTypeId ?? this.orderTypeId,
      orderServiceTypeUuid: orderServiceTypeUuid ?? this.orderServiceTypeUuid,
      batchReportUuid: batchReportUuid ?? this.batchReportUuid,
      terminalId: terminalId ?? this.terminalId,
      locationId: locationId ?? this.locationId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'uuid': uuid,
      // 'products': products.map((x) => x?.toMap()).toList(),
      'orderTrackNumber': orderTrackNumber,
      'transactionUuid': transactionUuid,
      'orderTicketStatusId': orderTicketStatusId,
      'saleChannelId': saleChannelId,
      'customerUuid': customerUuid,
      'serviceId': serviceId,
      'orderStatusId': orderStatusId,
      'totalAmount': totalAmount,
      'serviceCharges': serviceCharges,
      'discount': discount,
      'tax': tax,
      'tipsAmount': tipsAmount,
      'dineInTableUuid': dineInTableUuid,
      'orderTypeId': orderTypeId,
      'orderServiceTypeUuid': orderServiceTypeUuid,
      'batchReportUuid': batchReportUuid,
      'terminalId': terminalId,
      'locationId': locationId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    returnTAX() {
      if (map['tax'] is int) {
        return double.parse(map['tax'].toString());
      } else {
        return map['tax'];
      }
    }

    return OrderModel(
      id: map['id'] != null ? map['id'] as int : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      products: map['products'] != null
          ? List<OrderProductModel>.from(
              (map['products'] as dynamic).map<OrderProductModel?>(
                (x) => OrderProductModel.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      staffUUId: map['staff_uuid'] != null ? map['staff_uuid'] as String : null,
      orderTrackNumber: map['order_track_number'] != null
          ? map['order_track_number'] as String
          : null,
      transactionUuid: map['transaction_uuid'] != null
          ? map['transaction_uuid'] as String
          : null,
      orderTicketStatusId: map['order_ticket_status_id'] != null
          ? map['order_ticket_status_id'] as int
          : null,
      saleChannelId:
          map['sale_channel_id'] != null ? map['sale_channel_id'] as int : null,
      customerUuid:
          map['customer_uuid'] != null ? map['customer_uuid'] as String : null,
      serviceId:
          map['service_uuid'] != null ? map['service_uuid'] as String : null,
      orderStatusId:
          map['order_status_id'] != null ? map['order_status_id'] as int : null,
      totalAmount: double.parse(map['total_amount'] != null
          ? map['total_amount'].toString()
          : (0.0).toString()),
      serviceCharges: map['service_charges'] != null
          ? map['service_charges'] as String
          : null,
      discount: map['discount'] != null ? map['discount'] as String : null,
      tax: returnTAX(),
      tipsAmount:
          map['tips_amount'] != null ? map['tips_amount'] as double : null,
      dineInTableUuid: map['dine_in_table_uuid'] != null
          ? map['dine_in_table_uuid'] as String
          : null,
      orderTypeId:
          map['orderTypeId'] != null ? map['orderTypeId'] as int : null,
      orderServiceTypeUuid: map['orderServiceTypeUuid'] != null
          ? map['orderServiceTypeUuid'] as String
          : null,
      batchReportUuid: map['batch_report_uuid'] != null
          ? map['batch_report_uuid'] as String
          : null,
      terminalId: map['terminal_id'] != null ? map['terminal_id'] as int : null,
      locationId: map['location_id'] != null ? map['location_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, uuid: $uuid, products: $products, orderTrackNumber: $orderTrackNumber, transactionUuid: $transactionUuid, orderTicketStatusId: $orderTicketStatusId, saleChannelId: $saleChannelId, customerUuid: $customerUuid, serviceId: $serviceId, orderStatusId: $orderStatusId, totalAmount: $totalAmount, serviceCharges: $serviceCharges, discount: $discount, tax: $tax, tipsAmount: $tipsAmount, dineInTableUuid: $dineInTableUuid, orderTypeId: $orderTypeId, orderServiceTypeUuid: $orderServiceTypeUuid, batchReportUuid: $batchReportUuid, terminalId: $terminalId, locationId: $locationId)';
  }

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.uuid == uuid &&
        listEquals(other.products, products) &&
        other.orderTrackNumber == orderTrackNumber &&
        other.transactionUuid == transactionUuid &&
        other.orderTicketStatusId == orderTicketStatusId &&
        other.saleChannelId == saleChannelId &&
        other.customerUuid == customerUuid &&
        other.serviceId == serviceId &&
        other.orderStatusId == orderStatusId &&
        other.totalAmount == totalAmount &&
        other.serviceCharges == serviceCharges &&
        other.discount == discount &&
        other.tax == tax &&
        other.tipsAmount == tipsAmount &&
        other.dineInTableUuid == dineInTableUuid &&
        other.orderTypeId == orderTypeId &&
        other.orderServiceTypeUuid == orderServiceTypeUuid &&
        other.batchReportUuid == batchReportUuid &&
        other.terminalId == terminalId &&
        other.locationId == locationId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        uuid.hashCode ^
        products.hashCode ^
        orderTrackNumber.hashCode ^
        transactionUuid.hashCode ^
        orderTicketStatusId.hashCode ^
        saleChannelId.hashCode ^
        customerUuid.hashCode ^
        serviceId.hashCode ^
        orderStatusId.hashCode ^
        totalAmount.hashCode ^
        serviceCharges.hashCode ^
        discount.hashCode ^
        tax.hashCode ^
        tipsAmount.hashCode ^
        dineInTableUuid.hashCode ^
        orderTypeId.hashCode ^
        orderServiceTypeUuid.hashCode ^
        batchReportUuid.hashCode ^
        terminalId.hashCode ^
        locationId.hashCode;
  }
}
