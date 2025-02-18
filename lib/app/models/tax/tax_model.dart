
class TaxModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? uuid;
  int? version;
  DateTime? syncedAt;
  String? name;
  double? amount;

  TaxModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.version,
    this.syncedAt,
    this.name,
    this.amount,
  });

  // Convert JSON data to Tax object
  factory TaxModel.fromJson(Map<String, dynamic> json) => TaxModel(
        id: json['id'] as int?,
        createdAt: json['created_at'] != null
            ? DateTime.parse(json['created_at'] as String)
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.parse(json['updated_at'] as String)
            : null,
        uuid: json['uuid'] as String?,
        version: json['version'] as int?,
        syncedAt: json['synced_at'] != null
            ? DateTime.parse(json['synced_at'] as String)
            : null,
        name: json['name'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
      );

  // Convert Tax object to JSON data
  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'uuid': uuid,
        'version': version,
        'synced_at': syncedAt?.toIso8601String(),
        'name': name,
        'amount': amount,
      };
}
