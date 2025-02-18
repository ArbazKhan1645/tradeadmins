import 'package:equatable/equatable.dart';

// Equatable helps in implementing value equality for objects
class SaleChannelModel extends Equatable {
  // final int? localId;
  final int? id;
  final String? uuid;
  // final DateTime? createdAt;
  // final DateTime? updatedAt;
  // final int? version;
  // final DateTime? syncedAt;
  final String name;
  // final String? type;
  // final String? description;
  // final int countryId;
  // final int businessTypeId;
  // final int? saleChannelModeId;
  // final bool isActive;
  // final DateTime? startDuration;
  // final DateTime? endDuration;
  // final int? terminalId;
  // final String? logo;

  const SaleChannelModel({
    // this.localId,
    this.id,
    this.uuid,
    // this.createdAt,
    // this.updatedAt,
    // this.version,
    // this.syncedAt,
    required this.name,
    // this.type,
    // this.description,
    // required this.countryId,
    // required this.businessTypeId,
    // this.saleChannelModeId,
    // required this.isActive,
    // this.startDuration,
    // this.endDuration,
    // this.terminalId,
    // this.logo,
  });

  // Factory method to create SaleChannelData from JSON map
  factory SaleChannelModel.fromJson(Map<String, dynamic> json) {
    return SaleChannelModel(
      // localId: json['localId'] as int?,
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      // createdAt: json['created_at'] != null
      //     ? DateTime.parse(json['created_at'] as String)
      //     : null,
      // updatedAt: json['updated_at'] != null
      //     ? DateTime.parse(json['updated_at'] as String)
      //     : null,
      // version: json['version'] as int?,
      // syncedAt: json['synced_at'] != null
      //     ? DateTime.parse(json['synced_at'] as String)
      //     : null,
      name: json['name'] as String,
      // type: json['type'] as String?,
      // description: json['description'] as String?,
      // countryId: json['country_id'] as int,
      // businessTypeId: json['bussiness_type_id'] as int,
      // saleChannelModeId: json['saleChannelModeId'] as int?,
      // isActive: json['is_active'] as bool,
      // startDuration: json['startDuration'] != null
      //     ? DateTime.parse(json['startDuration'] as String)
      //     : null,
      // endDuration: json['endDuration'] != null
      //     ? DateTime.parse(json['endDuration'] as String)
      //     : null,
      // terminalId: json['terminalId'] as int?,
      // logo: json['logo'] as String?,
    );
  }

  // Method to convert SaleChannelData to JSON map
  Map<String, dynamic> toJson() {
    return {
      // 'localId': localId,
      'id': id,
      'uuid': uuid,
      // 'created_at': createdAt?.toIso8601String(),
      // 'updated_at': updatedAt?.toIso8601String(),
      // 'version': version,
      // 'synced_at': syncedAt?.toIso8601String(),
      'name': name,
      // 'type': type,
      // 'description': description,
      // 'country_id': countryId,
      // 'bussiness_type_id': businessTypeId,
      // 'saleChannelModeId': saleChannelModeId,
      // 'is_active': isActive,
      // 'startDuration': startDuration?.toIso8601String(),
      // 'endDuration': endDuration?.toIso8601String(),
      // 'terminalId': terminalId,
      // 'logo': logo,
    };
  }

  @override
  List<Object?> get props => [
        // localId,
        id,
        uuid,
        // createdAt,
        // updatedAt,
        // version,
        // syncedAt,
        name,
        // type,
        // description,
        // countryId,
        // businessTypeId,
        // saleChannelModeId,
        // isActive,
        // startDuration,
        // endDuration,
        // terminalId,
        // logo,
      ];
}
