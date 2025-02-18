class CategoryModel {
  final int? id;
  final String? uuid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final DateTime? syncedAt;
  final String name;
  final String? description;
  final String? backgroundColor;
  final String? textColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? fontSize;
  final int? productCols;
  final bool showOnDisplay;
  final String? parentUuid;

  final int? taxTypeId;
  final int? taxId;
  final int? productTypeId;
  final String? departmentUuid;
  final String? unit;

  CategoryModel({
    this.id,
    this.uuid,
    this.createdAt,
    this.updatedAt,
    this.version,
    this.syncedAt,
    required this.name,
    this.description,
    this.backgroundColor,
    this.textColor,
    this.buttonHeight,
    this.buttonWidth,
    this.fontSize,
    this.productCols,
    required this.showOnDisplay,
    this.parentUuid,
    this.taxTypeId,
    this.taxId,
    this.productTypeId,
    this.departmentUuid,
    this.unit,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      uuid: json['uuid'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_At'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      version: json['version'],
      syncedAt:
          json['synced_at'] != null ? DateTime.parse(json['synced_at']) : null,
      name: json['name'],
      description: json['description'],
      backgroundColor: json['background_color'],
      textColor: json['text_color'],
      buttonHeight: json['button_height']?.toDouble(),
      buttonWidth: json['button_width']?.toDouble(),
      fontSize: json['font_size']?.toDouble(),
      productCols: json['product_cols'],
      showOnDisplay: json['show_on_display'] ?? false,
      parentUuid: json['parent_uuid'],
      taxTypeId: json['tax_type_id'],
      taxId: json['tax_id'],
      productTypeId: json['product_type_id'],
      departmentUuid: json['department_uuid'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'version': version,
      'synced_at': syncedAt?.toIso8601String(),
      'name': name,
      'description': description,
      'background_color': backgroundColor,
      'text_color': textColor,
      'button_height': buttonHeight,
      'button_width': buttonWidth,
      'font_size': fontSize,
      'product_cols': productCols,
      'show_on_display': showOnDisplay,
      'parent_uuid': parentUuid,
      'tax_type_id': taxTypeId,
      'tax_id': taxId,
      'product_type_id': productTypeId,
      'department_uuid': departmentUuid,
      'unit': unit,
    };
  }
}
