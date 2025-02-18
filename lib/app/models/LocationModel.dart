class LocationModel {
  final int id;
  final String uuid;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String businessName;
  final String? telephoneNumber;
  final String? postcodeOrZipCode;
  final String? buildingNumber;
  final String? streetAddress;
  final String? city;
  final String? logo;
  final String? locationId;
  final String? website;
  final String? vatNumber;
  final String? email;
  final int merchantId;
  final bool isActive;
  final int businessTypeId;
  final int? deliveryModeId;
  final int countryId;

  LocationModel({
    required this.id,
    required this.uuid,
    required this.createdAt,
    this.updatedAt,
    this.version,
    required this.businessName,
    this.telephoneNumber,
    this.postcodeOrZipCode,
    this.buildingNumber,
    this.streetAddress,
    this.city,
    this.logo,
    this.locationId,
    this.website,
    this.vatNumber,
    this.email,
    required this.merchantId,
    this.isActive = false,
    required this.businessTypeId,
    this.deliveryModeId,
    required this.countryId,
  });

  // Factory method to create an instance from JSON
  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      uuid: json['uuid'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      version: json['version'],
      businessName: json['business_name'],
      telephoneNumber: json['telephone_number'],
      postcodeOrZipCode: json['postcode_or_zip_code'],
      buildingNumber: json['building_number'],
      streetAddress: json['street_address'],
      city: json['city'],
      logo: json['logo'],
      locationId: json['location_id'],
      website: json['website'],
      vatNumber: json['vat_number'],
      email: json['email'],
      merchantId: json['merchant_id'],
      isActive: json['is_active'] ?? false,
      businessTypeId: json['business_type_id'],
      deliveryModeId: json['delivery_mode_id'],
      countryId: json['country_id'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'version': version,
      'business_name': businessName,
      'telephone_number': telephoneNumber,
      'postcode_or_zip_code': postcodeOrZipCode,
      'building_number': buildingNumber,
      'street_address': streetAddress,
      'city': city,
      'logo': logo,
      'location_id': locationId,
      'website': website,
      'vat_number': vatNumber,
      'email': email,
      'merchant_id': merchantId,
      'is_active': isActive,
      'business_type_id': businessTypeId,
      'delivery_mode_id': deliveryModeId,
      'country_id': countryId,
    };
  }
}
