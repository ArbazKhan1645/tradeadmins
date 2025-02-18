class TerminalModel {
  final int id;
  final String uuid;
  final String? terminalId;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? localId;
  final int? version;
  final String name;
  final bool? available;
  final String? posThemeUuid;
  // final String? deviceTypeUuid;
  final int locationId;
  final String? defaultPrinterUuid;
  final int? hseDigiSoftwarePackageId;
  final bool? activeStatus;
  final bool? suspend;

  TerminalModel({
    required this.id,
    required this.uuid,
    this.terminalId,
    required this.createdAt,
    this.updatedAt,
    this.localId,
    this.version,
    required this.name,
    this.available,
    this.posThemeUuid,
    // this.deviceTypeUuid,
    required this.locationId,
    this.defaultPrinterUuid,
    this.hseDigiSoftwarePackageId,
    this.activeStatus,
    this.suspend,
  });

  factory TerminalModel.fromJson(Map<String, dynamic> json) {
    return TerminalModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      terminalId: json['terminal_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      localId: json['local_id'] as int?,
      version: json['version'] as int?,
      name: json['name'] as String,
      available: json['available'] as bool?,
      posThemeUuid: json['pos_theme_uuid'] as String?,
      // deviceTypeUuid: json['device_type_uuid'] as String?,
      locationId: json['location_id'] as int,
      defaultPrinterUuid: json['default_printer_uuid'] as String?,
      hseDigiSoftwarePackageId: json['hse_digi_software_package_id'] as int?,
      activeStatus: json['active_status'] ?? false,
      suspend: json['suspend'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'terminal_id': terminalId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'local_id': localId,
      'version': version,
      'name': name,
      'available': available,
      'pos_theme_uuid': posThemeUuid,
      // 'device_type_uuid': deviceTypeUuid,
      'location_id': locationId,
      'default_printer_uuid': defaultPrinterUuid,
      'hse_digi_software_package_id': hseDigiSoftwarePackageId,
      'active_status': activeStatus,
      'suspend': suspend,
    };
  }
}
