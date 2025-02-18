import 'dart:convert';

class OrderTicketStatusTableData {
  int? id;
  String? name;
  String? uuid;
  OrderTicketStatusTableData({
    this.id,
    this.name,
    this.uuid,
  });

  OrderTicketStatusTableData copyWith({
    int? id,
    String? name,
    String? uuid,
  }) {
    return OrderTicketStatusTableData(
      id: id ?? this.id,
      name: name ?? this.name,
      uuid: uuid ?? this.uuid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(uuid != null){
      result.addAll({'uuid': uuid});
    }
  
    return result;
  }

  factory OrderTicketStatusTableData.fromMap(Map<String, dynamic> map) {
    return OrderTicketStatusTableData(
      id: map['id']?.toInt(),
      name: map['name'],
      uuid: map['uuid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderTicketStatusTableData.fromJson(String source) => OrderTicketStatusTableData.fromMap(json.decode(source));

  @override
  String toString() => 'OrderTicketStatusTableData(id: $id, name: $name, uuid: $uuid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderTicketStatusTableData &&
      other.id == id &&
      other.name == name &&
      other.uuid == uuid;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ uuid.hashCode;
}
