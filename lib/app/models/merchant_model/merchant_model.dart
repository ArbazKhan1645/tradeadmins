class MerchantModel {
  int id;
  String uuid;
  String? pictureurl;
  var version;
  var localId;
  String firstName;
  String lastName;
  int? countryid;
  String email;
  final String createdAt;
  String phoneNumber;
  var partner_id;
  var merchantid;
  String? countryname;
  bool? activated;
  int? bussinesstype;

  MerchantModel(
      {required this.id,
      required this.uuid,
      this.activated,
      required this.countryid,
      this.pictureurl,
      required this.createdAt,
      required this.bussinesstype,
      required this.version,
      required this.merchantid,
      required this.localId,
      required this.firstName,
      required this.lastName,
      required this.email,
      this.countryname,
      required this.phoneNumber,
      required this.partner_id});

  factory MerchantModel.fromJson(Map<String, dynamic> json) {
    return MerchantModel(
        bussinesstype: json['business_type_id'],
        createdAt: json['created_at'],
        countryid: json['country_id'],
        id: json['id'],
        uuid: json['uuid'],
        pictureurl: json['pictureurl'] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHxzM_e4qVtnPZttfPhbjcPssC78WndotRPg&usqp=CAU',
        countryname: json['country_Name'] ?? '',
        merchantid: json['merchant_id'] ?? 'no nerchant',
        activated: json['activated'] ?? false,
        version: json['version'],
        localId: json['local_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phoneNumber: json['phone'],
        partner_id: json['partner_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'business_type_id': bussinesstype,
      // 'version': version,
      // 'local_id': localId,
      // 'pictureurl': pictureurl,
      'first_name': firstName,
      'last_name': lastName,
      // 'email': email,
      // 'phone': phoneNumber,
      // 'partner_id': partner_id
    };
  }
}
