// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class StaffModel {
  final int? id;
  final String? uuid;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? phone;
  final int? pin;
  final bool? is_active;
  final int? location_id;
  StaffModel({
    this.id,
    this.uuid,
    this.first_name,
    this.last_name,
    this.email,
    this.phone,
    this.pin,
    this.is_active,
    this.location_id,
  });

  StaffModel copyWith({
    int? id,
    String? uuid,
    String? first_name,
    String? last_name,
    String? email,
    String? phone,
    int? pin,
    bool? is_active,
    int? location_id,
  }) {
    return StaffModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      pin: pin ?? this.pin,
      is_active: is_active ?? this.is_active,
      location_id: location_id ?? this.location_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'first_name': first_name,
      'last_name': last_name,
      'email': email,
      'phone': phone,
      'pin': pin,
      'is_active': is_active,
      'location_id': location_id,
    };
  }

  factory StaffModel.fromMap(Map<String, dynamic> map) {
    return StaffModel(
      id: map['id'] != null ? map['id'] as int : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      pin: map['pin'] != null ? map['pin'] as int : null,
      is_active: map['is_active'] != null ? map['is_active'] as bool : null,
      location_id:
          map['location_id'] != null ? map['location_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StaffModel.fromJson(String source) =>
      StaffModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StaffModel(id: $id, uuid: $uuid, first_name: $first_name, last_name: $last_name, email: $email, phone: $phone, pin: $pin, is_active: $is_active, location_id: $location_id)';
  }

  @override
  bool operator ==(covariant StaffModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.first_name == first_name &&
        other.last_name == last_name &&
        other.email == email &&
        other.phone == phone &&
        other.pin == pin &&
        other.is_active == is_active &&
        other.location_id == location_id;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        first_name.hashCode ^
        last_name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        pin.hashCode ^
        is_active.hashCode ^
        location_id.hashCode;
  }
}
