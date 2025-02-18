class PartnerAppStoreModel {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? uuid;
  int? version;
  String? name;
  int? hseAppStoreCategoryId;
  String? hseCostPrice;
  int? countryId;
  List<int>? businessTypeId;
  List<dynamic>? images;
  bool? isActive;
  String? totalActivations;
  String? description;
  String? shortDescription;
  int? hsePackageIntervalDurationId;
  String? appReferenceNumber;
  int? taxId;
  int? taxTypeId;
  dynamic allModules;
  num? partnerSellingPrice;
  String? profitMargin;
  int? hseDigiPackageStatusId;
  int? partnerId;

  PartnerAppStoreModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.version,
    this.name,
    this.hseAppStoreCategoryId,
    this.hseCostPrice,
    this.countryId,
    this.businessTypeId,
    this.images,
    this.isActive,
    this.totalActivations,
    this.description,
    this.shortDescription,
    this.hsePackageIntervalDurationId,
    this.appReferenceNumber,
    this.taxId,
    this.taxTypeId,
    this.allModules,
    this.partnerSellingPrice,
    this.profitMargin,
    this.hseDigiPackageStatusId,
    this.partnerId,
  });

  factory PartnerAppStoreModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return PartnerAppStoreModel();

    return PartnerAppStoreModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      uuid: json['uuid'] as String?,
      version: json['version'] as int?,
      name: json['name'] as String?,
      hseAppStoreCategoryId: json['hse_app_store_category_id'] as int?,
      hseCostPrice: json['hse_cost_price'] as String?,
      countryId: json['country_id'] as int?,
      businessTypeId: json['business_type_id'] != null
          ? List<int>.from(json['business_type_id'])
          : [],
      images: json['images'] is List<dynamic>
          ? List<dynamic>.from(json['images'])
          : [],
      isActive: json['is_active'] as bool?,
      totalActivations: json['total_activations'] as String?,
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
      hsePackageIntervalDurationId:
          json['hse_package_interval_duration_id'] as int?,
      appReferenceNumber: json['app_reference_number'] as String?,
      taxId: json['tax_id'] as int?,
      taxTypeId: json['tax_type_id'] as int?,
      allModules: json['all_modules'],
      partnerSellingPrice: json['partner_selling_price'] as num?,
      profitMargin: json['profit_margin'] as String?,
      hseDigiPackageStatusId: json['hse_digi_package_status_id'] as int?,
      partnerId: json['partner_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'uuid': uuid,
      'version': version,
      'name': name,
      'hse_app_store_category_id': hseAppStoreCategoryId,
      'hse_cost_price': hseCostPrice,
      'country_id': countryId,
      'business_type_id': businessTypeId,
      'images': images,
      'is_active': isActive,
      'total_activations': totalActivations,
      'description': description,
      'short_description': shortDescription,
      'hse_package_interval_duration_id': hsePackageIntervalDurationId,
      'app_reference_number': appReferenceNumber,
      'tax_id': taxId,
      'tax_type_id': taxTypeId,
      'all_modules': allModules,
      'partner_selling_price': partnerSellingPrice,
      'profit_margin': profitMargin,
      'hse_digi_package_status_id': hseDigiPackageStatusId,
      'partner_id': partnerId,
    };
  }
}
