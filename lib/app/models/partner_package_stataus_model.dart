// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class PartnerPackageStatusModel {
  int? id;
  DateTime? created_at;
  DateTime? updated_at;
  String? uuid;
  int? version;
  String? status;
  PartnerPackageStatusModel({
    this.id,
    this.created_at,
    this.updated_at,
    this.uuid,
    this.version,
    this.status,
  });

  PartnerPackageStatusModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? uuid,
    int? version,
    String? status,
  }) {
    return PartnerPackageStatusModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      uuid: uuid ?? this.uuid,
      version: version ?? this.version,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at?.toIso8601String(),
      'updated_at': updated_at?.toIso8601String(),
      'uuid': uuid,
      'version': version,
      'status': status,
    };
  }

  factory PartnerPackageStatusModel.fromMap(Map<String, dynamic> map) {
    return PartnerPackageStatusModel(
      id: map['id'] != null ? map['id'] as int : null,
      created_at:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updated_at:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      version: map['version'] != null ? map['version'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartnerPackageStatusModel.fromJson(String source) =>
      PartnerPackageStatusModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartnerPackageStatusModel(id: $id, created_at: $created_at, updated_at: $updated_at, uuid: $uuid, version: $version, status: $status)';
  }

  @override
  bool operator ==(covariant PartnerPackageStatusModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.uuid == uuid &&
        other.version == version &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        uuid.hashCode ^
        version.hashCode ^
        status.hashCode;
  }
}
