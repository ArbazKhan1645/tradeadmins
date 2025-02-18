class HsePackageIntervalDurationModel {
  final int id;

  final String name;

  HsePackageIntervalDurationModel({
    required this.id,
    required this.name,
  });

  factory HsePackageIntervalDurationModel.fromJson(Map<String, dynamic> json) {
    return HsePackageIntervalDurationModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
    );
  }
}
