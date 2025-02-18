// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class TransactionModel {
  final int? id;
  final String? uuid;
  final String? transaction_number;
  final int? transaction_status_id;
  TransactionModel({
    this.id,
    this.uuid,
    this.transaction_number,
    this.transaction_status_id,
  });

  TransactionModel copyWith({
    int? id,
    String? uuid,
    String? transaction_number,
    int? transaction_status_id,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      transaction_number: transaction_number ?? this.transaction_number,
      transaction_status_id:
          transaction_status_id ?? this.transaction_status_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'transaction_number': transaction_number,
      'transaction_status_id': transaction_status_id,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] != null ? map['id'] as int : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      transaction_number: map['transaction_number'] != null
          ? map['transaction_number'] as String
          : null,
      transaction_status_id: map['transaction_status_id'] != null
          ? map['transaction_status_id'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(id: $id, uuid: $uuid, transaction_number: $transaction_number, transaction_status_id: $transaction_status_id)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.transaction_number == transaction_number &&
        other.transaction_status_id == transaction_status_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        transaction_number.hashCode ^
        transaction_status_id.hashCode;
  }
}

class TransactionsStatus {
  int? id;
  String? name;
  TransactionsStatus({
    this.id,
    this.name,
  });

  TransactionsStatus copyWith({
    int? id,
    String? name,
  }) {
    return TransactionsStatus(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory TransactionsStatus.fromMap(Map<String, dynamic> map) {
    return TransactionsStatus(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsStatus.fromJson(String source) =>
      TransactionsStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TransactionsStatus(id: $id, name: $name)';

  @override
  bool operator ==(covariant TransactionsStatus other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
