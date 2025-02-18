// ignore_for_file: file_names

class CountryModel {
  int id;
  String countryName;
  String? currency_symbol;
  String? aplhaCode;

  CountryModel(
      {required this.id,
      required this.countryName,
      required this.aplhaCode,
      this.currency_symbol});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        id: json['id'],
        currency_symbol: json['currency_symbol'] ?? '',
        countryName: json['name'],
        aplhaCode: json['alpha_2_code'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': countryName};
  }
}
