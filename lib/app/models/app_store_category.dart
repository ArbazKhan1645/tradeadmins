class AppStoreCategoryModel {
  int id;
  String? name;

  AppStoreCategoryModel({
    required this.id,
    required this.name,
  });

  factory AppStoreCategoryModel.fromJson(Map<String, dynamic> json) {
    return AppStoreCategoryModel(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
