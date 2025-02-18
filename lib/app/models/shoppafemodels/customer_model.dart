// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

// ignore_for_file: prefer_typing_uninitialized_variables

class CustomerModel {
  int? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? address;
  int? location_id;
  CustomerModel({
    this.id,
    this.location_id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
  });

  CustomerModel copyWith({
    int? id,
    String? uuid,
    String? firstName,
    String? lastName,
    int? location_id,
    String? email,
    String? phoneNumber,
    String? address,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      location_id: location_id ?? this.location_id,
      uuid: uuid ?? this.uuid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uuid': uuid,
      'location_id': location_id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      location_id:
          map['location_id'] != null ? map['location_id'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber: map['phone'] != null ? map['phone'] as String : null,
      address: map['street'] != null ? map['street'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerModel(id: $id, uuid: $uuid, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, address: $address, location_id: $location_id)';
  }

  @override
  bool operator ==(covariant CustomerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.location_id == location_id &&
        other.phoneNumber == phoneNumber &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        location_id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode;
  }
}
