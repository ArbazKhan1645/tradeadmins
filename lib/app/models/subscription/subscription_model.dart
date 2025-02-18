class SubscriptionModel {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;
  final String uuid;
  final String terminalUuid;
  final DateTime? startDate;
  final DateTime? dueDate;
  final int? recurringIntervalDuration;
  final String? deviceActivationToken;
  final int? subscriptionStatus;
  final String? packageName;
  final String? recurringAmount;
  final String? invoiceUuid;
  final int hsePartnerDigiPackageId;

  SubscriptionModel({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.version,
    required this.uuid,
    required this.terminalUuid,
    this.startDate,
    this.dueDate,
    this.recurringIntervalDuration,
    this.deviceActivationToken,
    this.subscriptionStatus,
    this.packageName,
    this.recurringAmount,
    this.invoiceUuid,
    required this.hsePartnerDigiPackageId,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      version: json['version'] as int,
      uuid: json['uuid'] as String,
      terminalUuid: json['terminal_uuid'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      dueDate: DateTime.parse(json['due_date'] as String),
      recurringIntervalDuration: json['recurring_interval_duration'] as int,
      deviceActivationToken: json['device_activation_token'] as String,
      subscriptionStatus: json['subscription_status'] as int,
      packageName: json['package_name'] as String,
      recurringAmount: json['recurring_amount'] as String,
      invoiceUuid: json['invoice_uuid'] as String,
      hsePartnerDigiPackageId: json['hse_partner_digi_package_id'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt!.toIso8601String(),
        'updated_at': updatedAt!.toIso8601String(),
        'version': version,
        'uuid': uuid,
        'terminal_uuid': terminalUuid,
        'start_date': startDate!.toIso8601String(),
        'due_date': dueDate!.toIso8601String(),
        'recurring_interval_duration': recurringIntervalDuration,
        'device_activation_token': deviceActivationToken,
        'subscription_status': subscriptionStatus,
        'package_name': packageName,
        'recurring_amount': recurringAmount,
        'invoice_uuid': invoiceUuid,
        'hse_partner_digi_package_id': hsePartnerDigiPackageId,
      };
}
