// ignore_for_file: file_names

class CountryModel {
  int id;
  String countryName;

  CountryModel({required this.id, required this.countryName});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(id: json['id'], countryName: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': countryName};
  }
}
