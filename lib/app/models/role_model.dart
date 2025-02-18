class RoleModel {
  final int? localId;
  final int? id;
  final String? uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final DateTime? syncedAt;
  final String name;
  final List<dynamic>? authorityIds;

  RoleModel({
    this.localId,
    this.id,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.syncedAt,
    required this.name,
    this.authorityIds,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      localId: json['localId'] as int?,
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['version'] as int?,
      syncedAt:
          json['syncedAt'] != null ? DateTime.parse(json['syncedAt']) : null,
      name: json['name'] as String,
      authorityIds: json['authorityIds'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'localId': localId,
      'id': id,
      'uuid': uuid,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'version': version,
      'syncedAt': syncedAt?.toIso8601String(),
      'name': name,
      'authorityIds': authorityIds,
    };
  }
}
