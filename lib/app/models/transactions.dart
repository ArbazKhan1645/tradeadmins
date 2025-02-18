class TransactionTableData {
  final int? localId;
  final int? id;
  final String? uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final DateTime? syncedAt;
  final DateTime? deletedAt;
  final String? transactionNumber;
  final String? orderUuid;
  final DateTime? completedAt;
  final int transactionStatusId;
  final int transactionTypeId;
  final double totalAmount;
  final double? paidAmount;

  const TransactionTableData({
    this.localId,
    this.id,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.syncedAt,
    this.deletedAt,
    this.transactionNumber,
    this.orderUuid,
    this.completedAt,
    required this.transactionStatusId,
    required this.transactionTypeId,
    required this.totalAmount,
    this.paidAmount,
  });

  // To convert model to map (optional, for serialization)
  Map<String, dynamic> toMap() {
    return {
      'localId': localId,
      'id': id,
      'uuid': uuid,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'version': version,
      'syncedAt': syncedAt?.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
      'transactionNumber': transactionNumber,
      'orderUuid': orderUuid,
      'completedAt': completedAt?.toIso8601String(),
      'transactionStatusId': transactionStatusId,
      'transactionTypeId': transactionTypeId,
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
    };
  }

  // Factory method to create object from map (optional, for deserialization)
  factory TransactionTableData.fromMap(Map<String, dynamic> map) {
    return TransactionTableData(
      localId: map['localId'],
      id: map['id'],
      uuid: map['uuid'],
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      version: map['version'],
      syncedAt: map['syncedAt'] != null ? DateTime.parse(map['syncedAt']) : null,
      deletedAt: map['deletedAt'] != null ? DateTime.parse(map['deletedAt']) : null,
      transactionNumber: map['transactionNumber'],
      orderUuid: map['orderUuid'],
      completedAt: map['completedAt'] != null ? DateTime.parse(map['completedAt']) : null,
      transactionStatusId: map['transactionStatusId'],
      transactionTypeId: map['transactionTypeId'],
      totalAmount: map['totalAmount'],
      paidAmount: map['paidAmount'],
    );
  }
}
