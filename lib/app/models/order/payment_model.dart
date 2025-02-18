import 'package:equatable/equatable.dart';

enum CurrencyType { USD, EUR, GBP } // Define CurrencyType enum
enum PaymentType { Card, Cash, Cheque } // Define PaymentType enum

class PaymentModel extends Equatable {
  final int? localId;
  final int? id;
  final String? uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final DateTime? syncedAt;
  final String transactionUuid;
  final CurrencyType currency;
  final PaymentType type;
  final String? paymentNumber;
  final int paymentStatusId;
  final double amount;
  final double changeAmount;
  final double givenAmount;

  const PaymentModel({
    this.localId,
    this.id,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.syncedAt,
    required this.transactionUuid,
    required this.currency,
    required this.type,
    this.paymentNumber,
    required this.paymentStatusId,
    required this.amount,
    required this.changeAmount,
    required this.givenAmount,
  });

  // Factory method to create PaymentModel from JSON map
  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      localId: json['localId'] as int?,
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'] as String) : null,
      version: json['version'] as int?,
      syncedAt: json['synced_at'] != null ? DateTime.parse(json['synced_at'] as String) : null,
      transactionUuid: json['transaction_uuid'] as String,
      currency: _parseCurrencyType(json['currency'] as String), // Parse CurrencyType enum
      type: _parsePaymentType(json['type'] as String), // Parse PaymentType enum
      paymentNumber: json['payment_number'] as String?,
      paymentStatusId: json['payment_status_id'] as int,
      amount: json['amount'] as double,
      changeAmount: json['change_amount'] as double,
      givenAmount: json['given_amount'] as double,
    );
  }

  // Helper method to parse CurrencyType enum from string
  static CurrencyType _parseCurrencyType(String currencyTypeString) {
    switch (currencyTypeString) {
      case 'USD':
        return CurrencyType.USD;
      case 'EUR':
        return CurrencyType.EUR;
      case 'GBP':
        return CurrencyType.GBP;
      default:
        throw ArgumentError('Invalid currency type: $currencyTypeString');
    }
  }

  // Helper method to parse PaymentType enum from string
  static PaymentType _parsePaymentType(String paymentTypeString) {
    switch (paymentTypeString) {
      case 'Card':
        return PaymentType.Card;
      case 'Cash':
        return PaymentType.Cash;
      case 'Cheque':
        return PaymentType.Cheque;
      default:
        throw ArgumentError('Invalid payment type: $paymentTypeString');
    }
  }

  // Method to convert PaymentModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'localId': localId,
      'id': id,
      'uuid': uuid,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'version': version,
      'synced_at': syncedAt?.toIso8601String(),
      'transaction_uuid': transactionUuid,
      'currency': currency.toString().split('.').last, // Convert CurrencyType enum to string
      'type': type.toString().split('.').last, // Convert PaymentType enum to string
      'payment_number': paymentNumber,
      'payment_status_id': paymentStatusId,
      'amount': amount,
      'change_amount': changeAmount,
      'given_amount': givenAmount,
    };
  }

  @override
  List<Object?> get props {
    return [
      localId,
      id,
      uuid,
      createdAt,
      updatedAt,
      version,
      syncedAt,
      transactionUuid,
      currency,
      type,
      paymentNumber,
      paymentStatusId,
      amount,
      changeAmount,
      givenAmount,
    ];
  }
}
