// ignore_for_file: file_names, non_constant_identifier_names

class BussinessTypeModel {
  int id;
  String name;
  int? business_category_id;

  BussinessTypeModel(
      {required this.id, required this.name, this.business_category_id});

  factory BussinessTypeModel.fromJson(Map<String, dynamic> json) {
    return BussinessTypeModel(
        id: json['id'],
        name: json['name'],
        business_category_id: json['business_category_id']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'business_category_id': business_category_id
    };
  }
}

class BussinessCategoryModel {
  int id;
  String name;

  BussinessCategoryModel({required this.id, required this.name});

  factory BussinessCategoryModel.fromJson(Map<String, dynamic> json) {
    return BussinessCategoryModel(id: json['id'], name: json['name']);
  }

  factory BussinessCategoryModel.fromJsons(Map<String, dynamic> json) {
    return BussinessCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
