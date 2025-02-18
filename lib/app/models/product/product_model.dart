class ProductModel {
  final int? id;

  final String? uuid;
  final String? createdAt;
  final String? updatedAt;
  final String? version;

  final double? buyingPrice;
  final double? sellingPrice;

  final String name;
  final int? brandId;
  final int? unitId;
  final int? groupId;
  final int? departmentId;

  final String? categoryUuid;
  final String? barcode;
  final bool? merge;
  final bool? featured;
  final int? taxId;
  final String? description;
  final String? backgroundColor;
  final String? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final bool? customName;
  final bool? weight;
  final bool? openPrice;
  final bool? showOnDisplay;
  final int? taxTypeId;
  final String? promotionUuid;
  final int? productTypeId;
  final String? parentUuid;
  final String? productAttributeSize;
  final String? productAttributeColour;
  final String? pluCode;
  final String? profitMargin;
  final int? ageRestrictionId;
  final int? popNoteId;
  final int? countryId;
  final int? businessTypeId;
  final String? imeiNumber;
  final int? serialNumber;
  final String? expiryDate;
  final bool? isActive;

  ProductModel({
    this.id,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.buyingPrice,
    this.sellingPrice,
    required this.name,
    this.brandId,
    this.unitId,
    this.groupId,
    this.departmentId,

    this.categoryUuid,
    this.barcode,
    this.merge,
    this.featured,
    this.taxId,
    this.description,
    this.backgroundColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.customName,
    this.weight,
    this.openPrice,
    this.showOnDisplay,
    this.taxTypeId,
    this.promotionUuid,
    this.productTypeId,
    this.parentUuid,
    this.productAttributeSize,
    this.productAttributeColour,
    this.pluCode,
    this.profitMargin,
    this.ageRestrictionId,
    this.popNoteId,
    this.countryId,
    this.businessTypeId,
    this.imeiNumber,
    this.serialNumber,
    this.expiryDate,
    this.isActive,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      version: json['version'].toString(),
      buyingPrice: json['buying_price'] as double?,
      sellingPrice: json['selling_price'] as double?,
      name: json['name'] as String,
      brandId: json['brand_id'] as int?,
      unitId: json['unit_id'] as int?,
      groupId: json['group_id'] as int?,
      departmentId: json['department_id'] as int?,
  
      categoryUuid: json['category_uuid'] as String?,
      barcode: json['barcode'] as String?,
      merge: json['merge'] as bool?,
      featured: json['featured'] as bool?,
      taxId: json['tax_id'] as int?,
      description: json['description'] as String?,
      backgroundColor: json['background_color'] as String?,
      textColor: json['text_color'] as String?,
      buttonWidth: json['button_width'] as double?,
      buttonHeight: json['button_height'] as double?,
      fontSize: json['font_size'] as double?,
      customName: json['custom_name'] as bool?,
      weight: json['weight'] as bool?,
      openPrice: json['open_price'] as bool?,
      showOnDisplay: json['show_on_display'] as bool?,
      taxTypeId: json['tax_type_id'] as int?,
      promotionUuid: json['promotion_uuid'] as String?,
      productTypeId: json['product_type_id'] as int?,
      parentUuid: json['parent_uuid'] as String?,
      productAttributeSize: json['product_attribute_size'] as String?,
      productAttributeColour: json['product_attribute_colour'] as String?,
      pluCode: json['plu_code'] as String?,
      profitMargin: json['profit_margin'] as String?,
      ageRestrictionId: json['age_restriction_id'] as int?,
      popNoteId: json['pop_note_id'] as int?,
      countryId: json['country_id'] as int?,
      businessTypeId: json['business_type_id'] as int?,
      imeiNumber: json['imei_number'] as String?,
      serialNumber: json['serial_number'] as int?,
      expiryDate: json['expiry_date'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'version': version,
      'buying_price': buyingPrice,
      'selling_price': sellingPrice,
      'name': name,
      'brand_id': brandId,
      'unit_id': unitId,
      'group_id': groupId,
      'department_id': departmentId,
    
      'category_uuid': categoryUuid,
      'barcode': barcode,
      'merge': merge,
      'featured': featured,
      'tax_id': taxId,
      'description': description,
      'background_color': backgroundColor,
      'text_color': textColor,
      'button_width': buttonWidth,
      'button_height': buttonHeight,
      'font_size': fontSize,
      'custom_name': customName,
      'weight': weight,
      'open_price': openPrice,
      'show_on_display': showOnDisplay,
      'tax_type_id': taxTypeId,
      'promotion_uuid': promotionUuid,
      'product_type_id': productTypeId,
      'parent_uuid': parentUuid,
      'product_attribute_size': productAttributeSize,
      'product_attribute_colour': productAttributeColour,
      'plu_code': pluCode,
      'profit_margin': profitMargin,
      'age_restriction_id': ageRestrictionId,
      'pop_note_id': popNoteId,
      'country_id': countryId,
      'business_type_id': businessTypeId,
      'imei_number': imeiNumber,
      'serial_number': serialNumber,
      'expiry_date': expiryDate,
      'is_active': isActive,
    };
  }

  ProductModel copyWith({
    int? id,
    String? uuid,
    String? createdAt,
    String? updatedAt,
    String? version,
    double? buyingPrice,
    double? sellingPrice,
    String? name,
    int? brandId,
    int? unitId,
    int? groupId,
    int? departmentId,

    String? categoryUuid,
    String? barcode,
    bool? merge,
    bool? featured,
    int? taxId,
    String? description,
    String? backgroundColor,
    String? textColor,
    double? buttonWidth,
    double? buttonHeight,
    double? fontSize,
    bool? customName,
    bool? weight,
    bool? openPrice,
    bool? showOnDisplay,
    int? taxTypeId,
    String? promotionUuid,
    int? productTypeId,
    String? parentUuid,
    String? productAttributeSize,
    String? productAttributeColour,
    String? pluCode,
    String? profitMargin,
    int? ageRestrictionId,
    int? popNoteId,
    int? countryId,
    int? businessTypeId,
    String? imeiNumber,
    int? serialNumber,
    String? expiryDate,
    bool? isActive,
  }) {
    return ProductModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      buyingPrice: buyingPrice ?? this.buyingPrice,
      sellingPrice: sellingPrice ?? this.sellingPrice,
      name: name ?? this.name,
      brandId: brandId ?? this.brandId,
      unitId: unitId ?? this.unitId,
      groupId: groupId ?? this.groupId,
      departmentId: departmentId ?? this.departmentId,
  
      categoryUuid: categoryUuid ?? this.categoryUuid,
      barcode: barcode ?? this.barcode,
      merge: merge ?? this.merge,
      featured: featured ?? this.featured,
      taxId: taxId ?? this.taxId,
      description: description ?? this.description,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      buttonWidth: buttonWidth ?? this.buttonWidth,
      buttonHeight: buttonHeight ?? this.buttonHeight,
      fontSize: fontSize ?? this.fontSize,
      customName: customName ?? this.customName,
      weight: weight ?? this.weight,
      openPrice: openPrice ?? this.openPrice,
      showOnDisplay: showOnDisplay ?? this.showOnDisplay,
      taxTypeId: taxTypeId ?? this.taxTypeId,
      promotionUuid: promotionUuid ?? this.promotionUuid,
      productTypeId: productTypeId ?? this.productTypeId,
      parentUuid: parentUuid ?? this.parentUuid,
      productAttributeSize: productAttributeSize ?? this.productAttributeSize,
      productAttributeColour:
          productAttributeColour ?? this.productAttributeColour,
      pluCode: pluCode ?? this.pluCode,
      profitMargin: profitMargin ?? this.profitMargin,
      ageRestrictionId: ageRestrictionId ?? this.ageRestrictionId,
      popNoteId: popNoteId ?? this.popNoteId,
      countryId: countryId ?? this.countryId,
      businessTypeId: businessTypeId ?? this.businessTypeId,
      imeiNumber: imeiNumber ?? this.imeiNumber,
      serialNumber: serialNumber ?? this.serialNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      isActive: isActive ?? this.isActive,
    );
  }
}
