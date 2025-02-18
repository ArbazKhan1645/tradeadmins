
class PageModel {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String name;
  final String? type;

  PageModel({
    required this.id,
    required this.uuid,
    required this.createdAt,
    this.updatedAt,
    this.version,
    required this.name,
    this.type,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      version: json['version'] as int?,
      name: json['name'] as String,
      type: json['device_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'version': version,
      'name': name,
      'device_type': type,
    };
  }
}
