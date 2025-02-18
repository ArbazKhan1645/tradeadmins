class PosThemeModel {
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String uuid;
  final String name;
  final String image;
  final int? businessTypeId;
  final int deviceTypeId;

  PosThemeModel({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.uuid,
    required this.name,
    required this.image,
    this.businessTypeId,
    required this.deviceTypeId,
  });

  factory PosThemeModel.fromJson(Map<String, dynamic> json) {
    return PosThemeModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      businessTypeId: json['business_type_id'] as int?,
      deviceTypeId: json['device_type_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'uuid': uuid,
      'name': name,
      'image': image,
      'business_type_id': businessTypeId,
      'device_type_id': deviceTypeId,
    };
  }
}
