// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class BrandingModel {
  int? id;
  DateTime? created_at;
  DateTime? updated_at;
  String? uuid;
  int? version;
  String? business_name;
  String? logo;
  int? partner_table_id;
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
  bool? is_active;
  BrandingModel({
    this.id,
    this.created_at,
    this.updated_at,
    this.uuid,
    this.version,
    this.business_name,
    this.logo,
    this.partner_table_id,
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
    this.is_active,
  });

  BrandingModel copyWith({
    int? id,
    DateTime? created_at,
    DateTime? updated_at,
    String? uuid,
    int? version,
    String? business_name,
    String? logo,
    int? partner_table_id,
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
    bool? is_active,
  }) {
    return BrandingModel(
      id: id ?? this.id,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      uuid: uuid ?? this.uuid,
      version: version ?? this.version,
      business_name: business_name ?? this.business_name,
      logo: logo ?? this.logo,
      partner_table_id: partner_table_id ?? this.partner_table_id,
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
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'created_at': created_at?.toUtc().toIso8601String(),
      'updated_at': updated_at?.toUtc().toIso8601String(),
      'uuid': uuid,
      'version': version,
      'business_name': business_name,
      'logo': logo,
      'partner_table_id': partner_table_id,
      'post_zip_code': post_zip_code,
      'building_number': building_number,
      'address': address,
      'city': city,
      'country': country,
      'website': website,
      'email': email,
      'phone_number': phone_number,
      'facebook': facebook,
      'youtube': youtube,
      'google': google,
      'is_active': is_active,
    };
  }

  factory BrandingModel.fromMap(Map<String, dynamic> map) {
    return BrandingModel(
      id: map['id'] != null ? map['id'] as int : null,
      created_at:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updated_at:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      version: map['version'] != null ? map['version'] as int : null,
      business_name:
          map['business_name'] != null ? map['business_name'] as String : null,
      logo: map['logo'] != null ? map['logo'] as String : null,
      partner_table_id: map['partner_table_id'] != null
          ? map['partner_table_id'] as int
          : null,
      post_zip_code:
          map['post_zip_code'] != null ? map['post_zip_code'] as String : null,
      building_number: map['building_number'] != null
          ? map['building_number'] as String
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      youtube: map['youtube'] != null ? map['youtube'] as String : null,
      google: map['google'] != null ? map['google'] as String : null,
      is_active: map['is_active'] != null ? map['is_active'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandingModel.fromJson(String source) =>
      BrandingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BrandingModel(id: $id, created_at: $created_at, updated_at: $updated_at, uuid: $uuid, version: $version, business_name: $business_name, logo: $logo, partner_table_id: $partner_table_id, post_zip_code: $post_zip_code, building_number: $building_number, address: $address, city: $city, country: $country, website: $website, email: $email, phone_number: $phone_number, facebook: $facebook, youtube: $youtube, google: $google, is_active: $is_active)';
  }

  @override
  bool operator ==(covariant BrandingModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.created_at == created_at &&
        other.updated_at == updated_at &&
        other.uuid == uuid &&
        other.version == version &&
        other.business_name == business_name &&
        other.logo == logo &&
        other.partner_table_id == partner_table_id &&
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
        other.is_active == is_active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode ^
        uuid.hashCode ^
        version.hashCode ^
        business_name.hashCode ^
        logo.hashCode ^
        partner_table_id.hashCode ^
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
        is_active.hashCode;
  }
}
