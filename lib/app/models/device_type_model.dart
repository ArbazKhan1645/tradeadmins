
class DeviceTypeModel {
  final int id;
  final String createdAt;
  final String? updatedAt;
  final String uuid;
  final String? name;
  final String? icon;
  final String businessTypeUuid;

  DeviceTypeModel({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.uuid,
    this.name,
    this.icon,
    required this.businessTypeUuid,
  });

  factory DeviceTypeModel.fromJson(Map<String, dynamic> json) {
    return DeviceTypeModel(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
      uuid: json['uuid'] as String,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      businessTypeUuid: json['business_type_uuid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'uuid': uuid,
      'name': name,
      'icon': icon,
      'business_type_uuid': businessTypeUuid,
    };
  }
}
