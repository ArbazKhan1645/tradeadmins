class ProductInventoryModel {
  final int id;
  final String uuid;
  final String createdAt;
  final String? updatedAt;
  final String version;
  final int stock;
  final String productUuid;
  final String? supplierUuid;

  final String? reorderLevel;
  final String? reorderQuantity;
  final String? lastStockUpdate;
  final String? stockLocation;
  final String? lowStockLevelAlerts;
  final int? productStatusId;
  final String? skuNumber;

  ProductInventoryModel({
    required this.id,
    required this.uuid,
    required this.createdAt,
    this.updatedAt,
    required this.version,
    required this.stock,
    required this.productUuid,
    this.supplierUuid,
    this.reorderLevel,
    this.reorderQuantity,
    this.lastStockUpdate,
    this.stockLocation,
    this.lowStockLevelAlerts,
    this.productStatusId,
    this.skuNumber,
  });

  factory ProductInventoryModel.fromJson(Map<String, dynamic> json) {
    return ProductInventoryModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at']?.toString(), // Convert to string or null
      version: json['version'].toString(), // Convert to string
      stock: json['stock'] as int,
      productUuid: json['product_uuid'] as String,
      supplierUuid:
          json['supplier_uuid']?.toString(), // Convert to string or null
      reorderLevel:
          json['reorder_level']?.toString(), // Convert to string or null
      reorderQuantity:
          json['reorder_quantity']?.toString(), // Convert to string or null
      lastStockUpdate:
          json['last_stock_update']?.toString(), // Convert to string or null
      stockLocation:
          json['stock_location']?.toString(), // Convert to string or null
      lowStockLevelAlerts: json['low_stock_level_alerts']
          ?.toString(), // Convert to string or null
      productStatusId: json['product_status_id'] as int?, // Nullable int
      skuNumber: json['sku_number']?.toString(), // Convert to string or null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'version': version,
      'stock': stock,
      'product_uuid': productUuid,
      'supplier_uuid': supplierUuid,
      'reorder_level': reorderLevel,
      'reorder_quantity': reorderQuantity,
      'last_stock_update': lastStockUpdate,
      'stock_location': stockLocation,
      'low_stock_level_alerts': lowStockLevelAlerts,
      'product_status_id': productStatusId,
      'sku_number': skuNumber,
    };
  }
}
