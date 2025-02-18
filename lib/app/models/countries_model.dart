class CountriesModel {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String name;
  final String alpha2Code;
  final String? description;

  CountriesModel({
    required this.id,
    required this.uuid,
    required this.createdAt,
    this.updatedAt,
    this.version,
    required this.name,
    required this.alpha2Code,
    this.description,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      version: json['version'] as int?,
      name: json['name'] as String,
      alpha2Code: json['alpha_2_code'] as String,
      description: json['description'] as String?,
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
      'alpha_2_code': alpha2Code,
      'description': description,
    };
  }
}
