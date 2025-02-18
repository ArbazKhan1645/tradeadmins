// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class HelplineModel {
  int? id;
  String? name;
  DateTime? created_at;
  DateTime? updated_at;
  String? phone_number;
  String? email;
  String? uuid;
  String? whatsapp;
  int? version;
  int? partner_table_id;
  String? live_chat;
  String? description;
  bool? is_active;
  String? helpline_account_id;
  HelplineModel({
    this.id,
    this.name,
    this.created_at,
    this.updated_at,
    this.phone_number,
    this.email,
    this.uuid,
    this.whatsapp,
    this.version,
    this.partner_table_id,
    this.live_chat,
    this.description,
    this.is_active,
    this.helpline_account_id,
  });

  HelplineModel copyWith({
    int? id,
    String? name,
    DateTime? created_at,
    DateTime? updated_at,
    String? phone_number,
    String? email,
    String? uuid,
    String? whatsapp,
    int? version,
    int? partner_table_id,
    String? live_chat,
    String? description,
    bool? is_active,
    String? helpline_account_id,
  }) {
    return HelplineModel(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      phone_number: phone_number ?? this.phone_number,
      email: email ?? this.email,
      uuid: uuid ?? this.uuid,
      whatsapp: whatsapp ?? this.whatsapp,
      version: version ?? this.version,
      partner_table_id: partner_table_id ?? this.partner_table_id,
      live_chat: live_chat ?? this.live_chat,
      description: description ?? this.description,
      is_active: is_active ?? this.is_active,
      helpline_account_id: helpline_account_id ?? this.helpline_account_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,

      'phone_number': phone_number,
      'email': email,

      'whatsapp': whatsapp,
      'version': version,
      'partner_table_id': partner_table_id,
      'live_chat': live_chat,
      'description': description,
      'is_active': is_active,
      'helpline_account_id': helpline_account_id,
    };
  }

  factory HelplineModel.fromMap(Map<String, dynamic> map) {
    return HelplineModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      created_at:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updated_at:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      whatsapp: map['whatsapp'] != null ? map['whatsapp'] as String : null,
      version: map['version'] != null ? map['version'] as int : null,
      partner_table_id: map['partner_table_id'] != null
          ? map['partner_table_id'] as int
          : null,
      live_chat: map['live_chat'] != null ? map['live_chat'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      is_active: map['is_active'] != null ? map['is_active'] as bool : null,
      helpline_account_id: map['helpline_account_id'] != null
          ? map['helpline_account_id'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HelplineModel.fromJson(String source) =>
      HelplineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HelplineModel(id: $id, name: $name, created_at: $created_at, updated_at: $updated_at, phone_number: $phone_number, email: $email, uuid: $uuid, whatsapp: $whatsapp, version: $version, partner_table_id: $partner_table_id, live_chat: $live_chat, description: $description, is_active: $is_active, helpline_account_id: $helpline_account_id)';
  }

  @override
  bool operator ==(covariant HelplineModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.phone_number == phone_number &&
        other.email == email &&
        other.uuid == uuid &&
        other.whatsapp == whatsapp &&
        other.version == version &&
        other.partner_table_id == partner_table_id &&
        other.live_chat == live_chat &&
        other.description == description &&
        other.is_active == is_active &&
        other.helpline_account_id == helpline_account_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        phone_number.hashCode ^
        email.hashCode ^
        uuid.hashCode ^
        whatsapp.hashCode ^
        version.hashCode ^
        partner_table_id.hashCode ^
        live_chat.hashCode ^
        description.hashCode ^
        is_active.hashCode ^
        helpline_account_id.hashCode;
  }
}
