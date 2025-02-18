// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


// ignore_for_file: non_constant_identifier_names

class HsePackageIntervalModel {
  int? id;
  DateTime? created_at;
  DateTime? updated_at;
  String? uuid;
  int? version;
  String? name;
  HsePackageIntervalModel({
    this.id,
    this.created_at,
    this.updated_at,
    this.uuid,
    this.version,
    this.name,
  });
  

  HsePackageIntervalModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? uuid,
    int? version,
    String? name,
  }) {
    return HsePackageIntervalModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      uuid: uuid ?? this.uuid,
      version: version ?? this.version,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at?.toIso8601String(),
      'updated_at': updated_at?.toIso8601String(),
      'uuid': uuid,
      'version': version,
      'name': name,
    };
  }

  factory HsePackageIntervalModel.fromMap(Map<String, dynamic> map) {
    return HsePackageIntervalModel(
      id: map['id'] != null ? map['id'] as int : null,
      created_at: map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updated_at: map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      version: map['version'] != null ? map['version'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HsePackageIntervalModel.fromJson(String source) => HsePackageIntervalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HsePackageIntervalModel(id: $id, created_at: $created_at, updated_at: $updated_at, uuid: $uuid, version: $version, name: $name)';
  }

  @override
  bool operator ==(covariant HsePackageIntervalModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.created_at == created_at &&
      other.updated_at == updated_at &&
      other.uuid == uuid &&
      other.version == version &&
      other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      uuid.hashCode ^
      version.hashCode ^
      name.hashCode;
  }
}
