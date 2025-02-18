class HseSoftwarePackageModel {
  final int id;
  final String uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String? name;
  final double? hseCostPrice;
  final double? hseSalePrice;
  final String description;
  final String shortDescription;
  final List<dynamic> images;
  final List<dynamic> businessTypeIds;
  final int? packageCategoryId;
  final int? deviceTypeId;
  final int? partnerCategoryId;
  final int? countryId;
  final double? setUpCost;
  final double? sellPrice;
  final int? saleChannelId;

  HseSoftwarePackageModel({
    required this.id,
    required this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.name,
    this.hseCostPrice,
    this.hseSalePrice,
    required this.description,
    required this.shortDescription,
    required this.images,
    required this.businessTypeIds,
    this.packageCategoryId,
    this.deviceTypeId,
    this.partnerCategoryId,
    this.countryId,
    this.setUpCost,
    this.sellPrice,
    this.saleChannelId,
  });

  factory HseSoftwarePackageModel.fromJson(Map<String, dynamic> json) {
    return HseSoftwarePackageModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      version: json['version'] as int?,
      name: json['name'] as String?,
      hseCostPrice: json['partner_sale_price'] as double?,
      hseSalePrice: json['hse_price'] as double?,
      description: json['description'] as String,
      shortDescription: json['short_description'] as String,
      images: json['images'] as List<dynamic>,
      businessTypeIds: json['businessTypeIds'] != null
          ? List<dynamic>.from(json['businessTypeIds'])
          : [],
      packageCategoryId: json['package_category_id'] as int?,
      deviceTypeId: json['device_type_id'] as int?,
      partnerCategoryId: json['partner_category_id'] as int?,
      countryId: json['country_id'] as int?,
      setUpCost: json['set_up_cost'] as double?,
      sellPrice: json['sell_price'] as double?,
      saleChannelId: json['sale_channel_id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'version': version,
      'name': name,
      'partner_sale_price': hseCostPrice,
      'hse_price': hseSalePrice,
      'description': description,
      'short_description': shortDescription,
      'images': images,
      'businessTypeIds': businessTypeIds,
      'package_category_id': packageCategoryId,
      'device_type_id': deviceTypeId,
      'partner_category_id': partnerCategoryId,
      'country_id': countryId,
      'set_up_cost': setUpCost,
      'sell_price': sellPrice,
      'sale_channel_id': saleChannelId,
    };
  }
}
