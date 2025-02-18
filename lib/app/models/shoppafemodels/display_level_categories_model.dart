class DisplayLevelCategoriesModel {
  String name;
  int id;
  DateTime? created_at;
  String uuid;

  DisplayLevelCategoriesModel(
      {required this.name,
      required this.id,
      required this.uuid,
      required this.created_at});

  factory DisplayLevelCategoriesModel.fromJson(Map<String, dynamic> json) {
    return DisplayLevelCategoriesModel(
        created_at: json['created_at'] != null
            ? DateTime.parse(json['created_at'].toString())
            : null,
        name: json['name'],
        id: json['category_id'],
        uuid: json['uuid'] ?? '');
  }
}
