// class CustomerModel {
//   int? id;
//   String? uuid;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? version;
//   DateTime? syncedAt;
//   String firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? zipOrPostalCode;
//   String? buildingNumber;
//   String? street;
//   String? city;
//   String? country;
 

//   CustomerModel({
//     this.id,
//     this.uuid,
//     this.createdAt,
//     this.updatedAt,
//     this.version,
//     this.syncedAt,
//     required this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.zipOrPostalCode,
//     this.buildingNumber,
//     this.street,
//     this.city,
//     this.country,
 
//   });

//   factory CustomerModel.fromJson(Map<String, dynamic> json) {
//     return CustomerModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       createdAt:
//           json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
//       updatedAt:
//           json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
//       version: json['version'],
//       syncedAt:
//           json['synced_at'] != null ? DateTime.parse(json['synced_at']) : null,
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       email: json['email'],
//       phone: json['phone'],
//       zipOrPostalCode: json['zip_or_postal_code'],
//       buildingNumber: json['building_number'],
//       street: json['street'],
//       city: json['city'],
//       country: json['country'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'uuid': uuid,
//       'created_at': createdAt?.toIso8601String(),
//       'updated_at': updatedAt?.toIso8601String(),
//       'version': version,
//       'synced_at': syncedAt?.toIso8601String(),
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'phone': phone,
//       'zip_or_postal_code': zipOrPostalCode,
//       'building_number': buildingNumber,
//       'street': street,
//       'city': city,
//       'country': country,
//     };
//   }
// }
