class HsePartnerPackageModel {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String uuid;
  final int? version;
  final double? setUpPrice;
  final double? partnerSellingPrice;
  final int? partnerId;
  final String packageName;
  final int hseDigiPackageTableId;
  final String? packageReferenceNumber;
  final double? hseCostPrice;
  final String? image;
  final int? totalActivations;
  final bool? status;
  final DateTime? syncedAt;
  final int? partnerPackageStatusId;
  final int? hsePackageIntervalDurationId;
  final String? profitMargin;
  final int? taxTableId;
  final int? taxTypeId;
  final int? countryId;
  final String? description;
  final String? shortDescription;
  final List<int>? businessTypeId;

  HsePartnerPackageModel({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.uuid,
    this.version,
    this.setUpPrice,
    this.countryId,
    this.partnerSellingPrice,
    this.partnerId,
    required this.packageName,
    required this.hseDigiPackageTableId,
    this.packageReferenceNumber,
    this.hseCostPrice,
    this.image,
    this.totalActivations,
    this.status,
    this.syncedAt,
    this.partnerPackageStatusId,
    this.hsePackageIntervalDurationId,
    this.profitMargin,
    this.taxTableId,
    this.taxTypeId,
    this.businessTypeId,
    this.description,
    this.shortDescription,
  });
  factory HsePartnerPackageModel.fromJson(Map<String, dynamic> json) {
    return HsePartnerPackageModel(
      id: json['id'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
      uuid: json['uuid'] ?? '',
      version: json['version'] ?? 0,
      setUpPrice:
          json['set_up_price'] != null ? json['set_up_price'].toDouble() : 0.0,
      partnerSellingPrice: json['partner_selling_price'] != null
          ? json['partner_selling_price'].toDouble()
          : 0.0,
      partnerId: json['partner_id'] ?? 0,
      packageName: json['package_name'] ?? '',
      hseDigiPackageTableId: json['hse_digi_package_table_id'] ?? 0,
      packageReferenceNumber: json['package_reference_number'] ?? '',
      hseCostPrice: json['hse_cost_price'] != null
          ? json['hse_cost_price'].toDouble()
          : 0.0,
      image: json['image'] ?? '',
      totalActivations: json['total_activations'] ?? 0,
      status: json['status'] ?? false,
      syncedAt: json['synced_at'] != null
          ? DateTime.parse(json['synced_at'])
          : DateTime.now(),
      partnerPackageStatusId: json['partner_package_status_id'] ?? 0,
      hsePackageIntervalDurationId:
          json['hse_package_interval_duration_id'] ?? 0,
      profitMargin: json['profit_margin'] ?? '',
      taxTableId: json['tax_table_id'] ?? 0,
      taxTypeId: json['tax_type_id'] ?? 0,
      countryId: json['country_id'] ?? 0,
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      businessTypeId: json['business_type_id'] != null
          ? List<int>.from(json['business_type_id'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt!.toIso8601String(),
      'updated_at': updatedAt!.toIso8601String(),
      'uuid': uuid,
      'version': version,
      'set_up_price': setUpPrice,
      'partner_selling_price': partnerSellingPrice,
      'partner_id': partnerId,
      'package_name': packageName,
      'hse_digi_package_table_id': hseDigiPackageTableId,
      'package_reference_number': packageReferenceNumber,
      'hse_cost_price': hseCostPrice,
      'images': image,
      'total_activations': totalActivations,
      'status': status,
      'synced_at': syncedAt!.toIso8601String(),
      'partner_package_status_id': partnerPackageStatusId,
      'hse_package_interval_duration_id': hsePackageIntervalDurationId,
      'profit_margin': profitMargin,
      'tax_table_id': taxTableId,
      'tax_type_id': taxTypeId,
      'business_type_id': businessTypeId,
      'country_id': countryId,
      'description': description,
      'short_description': shortDescription,
    };
  }

  // create copy function
  HsePartnerPackageModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? uuid,
    int? version,
    double? setUpPrice,
    double? partnerSellingPrice,
    int? partnerId,
    String? packageName,
    int? hseDigiPackageTableId,
    String? packageReferenceNumber,
    double? hseCostPrice,
    String? image,
    int? totalActivations,
    bool? status,
    DateTime? syncedAt,
    int? partnerPackageStatusId,
    int? hsePackageIntervalDurationId,
    String? profitMargin,
    int? taxTableId,
    int? taxTypeId,
    int? countryId,
    String? description,
    String? shortDescription,
    List<int>? businessTypeId,
  }) {
    return HsePartnerPackageModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      uuid: uuid ?? this.uuid,
      version: version ?? this.version,
      setUpPrice: setUpPrice ?? this.setUpPrice,
      partnerSellingPrice: partnerSellingPrice ?? this.partnerSellingPrice,
      partnerId: partnerId ?? this.partnerId,
      packageName: packageName ?? this.packageName,
      hseDigiPackageTableId:
          hseDigiPackageTableId ?? this.hseDigiPackageTableId,
      packageReferenceNumber:
          packageReferenceNumber ?? this.packageReferenceNumber,
      hseCostPrice: hseCostPrice ?? this.hseCostPrice,
      image: image ?? this.image,
      totalActivations: totalActivations ?? this.totalActivations,
      status: status ?? this.status,
      syncedAt: syncedAt ?? this.syncedAt,
      partnerPackageStatusId:
          partnerPackageStatusId ?? this.partnerPackageStatusId,
      hsePackageIntervalDurationId:
          hsePackageIntervalDurationId ?? this.hsePackageIntervalDurationId,
      profitMargin: profitMargin ?? this.profitMargin,
      taxTableId: taxTableId ?? this.taxTableId,
      taxTypeId: taxTypeId ?? this.taxTypeId,
      countryId: countryId ?? this.countryId,
      description: description ?? this.description,
      shortDescription: shortDescription ?? this.shortDescription,
      businessTypeId: businessTypeId ?? this.businessTypeId,
    );
  }
}
