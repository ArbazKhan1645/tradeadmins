// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class PartnerBrandingModel {
  int? id;
  String? uuid;
  int? partner_table_id;
  String? business_name;
  String? post_zip_code;
  String? building_number;
  String? address;
  String? city;
  String? country;
  String? website;
  String? email;
  String? phone_number;
  String? facebook;
  String? youtube;
  String? google;
  String? logo;
  bool? is_active;
  PartnerBrandingModel({
    this.id,
    this.uuid,
    this.partner_table_id,
    this.business_name,
    this.post_zip_code,
    this.building_number,
    this.address,
    this.city,
    this.country,
    this.website,
    this.email,
    this.phone_number,
    this.facebook,
    this.youtube,
    this.google,
    this.logo,
    this.is_active,
  });

  PartnerBrandingModel copyWith({
    int? id,
    String? uuid,
    int? partner_table_id,
    String? business_name,
    String? post_zip_code,
    String? building_number,
    String? address,
    String? city,
    String? country,
    String? website,
    String? email,
    String? phone_number,
    String? facebook,
    String? youtube,
    String? google,
    String? logo,
    bool? is_active,
  }) {
    return PartnerBrandingModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      partner_table_id: partner_table_id ?? this.partner_table_id,
      business_name: business_name ?? this.business_name,
      post_zip_code: post_zip_code ?? this.post_zip_code,
      building_number: building_number ?? this.building_number,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      website: website ?? this.website,
      email: email ?? this.email,
      phone_number: phone_number ?? this.phone_number,
      facebook: facebook ?? this.facebook,
      youtube: youtube ?? this.youtube,
      google: google ?? this.google,
      logo: logo ?? this.logo,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partner_table_id': partner_table_id,
      'business_name': business_name,
      'post_zip_code': post_zip_code,
      'building_number': building_number,
      'address': address,
      'city': city,
      'country': country,
      'website': website,
      'email': email,
      'phone_number': phone_number,
      // 'facebook': facebook,
      // 'youtube': youtube,
      // 'google': google,
      'logo': logo,
      'is_active': is_active,
    };
  }

  factory PartnerBrandingModel.fromMap(Map<String, dynamic> map) {
    return PartnerBrandingModel(
      id: map['id'],
      uuid: map['uuid'] ?? '',
      partner_table_id: map['partner_table_id'],
      business_name: map['business_name'] ?? '',
      post_zip_code: map['post_zip_code'] ?? '',
      building_number: map['building_number'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      country: map['country'] ?? '',
      website: map['website'] ?? '',
      email: map['email'] ?? '',
      phone_number: map['phone_number'] ?? '',
      facebook: map['facebook'] ?? '',
      youtube: map['youtube'] ?? '',
      google: map['google'] ?? '',
      logo: map['logo'] ?? '',
      is_active: map['is_active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory PartnerBrandingModel.fromJson(String source) =>
      PartnerBrandingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PartnerBrandingModel(id: $id, uuid: $uuid, partner_table_id: $partner_table_id, business_name: $business_name, post_zip_code: $post_zip_code, building_number: $building_number, address: $address, city: $city, country: $country, website: $website, email: $email, phone_number: $phone_number, facebook: $facebook, youtube: $youtube, google: $google, logo: $logo, is_active: $is_active)';
  }

  @override
  bool operator ==(covariant PartnerBrandingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uuid == uuid &&
        other.partner_table_id == partner_table_id &&
        other.business_name == business_name &&
        other.post_zip_code == post_zip_code &&
        other.building_number == building_number &&
        other.address == address &&
        other.city == city &&
        other.country == country &&
        other.website == website &&
        other.email == email &&
        other.phone_number == phone_number &&
        other.facebook == facebook &&
        other.youtube == youtube &&
        other.google == google &&
        other.logo == logo &&
        other.is_active == is_active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uuid.hashCode ^
        partner_table_id.hashCode ^
        business_name.hashCode ^
        post_zip_code.hashCode ^
        building_number.hashCode ^
        address.hashCode ^
        city.hashCode ^
        country.hashCode ^
        website.hashCode ^
        email.hashCode ^
        phone_number.hashCode ^
        facebook.hashCode ^
        youtube.hashCode ^
        google.hashCode ^
        logo.hashCode ^
        is_active.hashCode;
  }
}
