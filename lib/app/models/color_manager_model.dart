class ColorManagerModel {
  final int? id;
  final String? uuid;
  final int locationId;
  final String appBarColor;
  final String appBarTextColor;
  final String bodyColor;
  final String bodyButtonColor;
  final String bodyButtonTextColor;
  final String bodyTextColor;

  ColorManagerModel({
    this.id,
    this.uuid,
    required this.locationId,
    required this.appBarColor,
    required this.appBarTextColor,
    required this.bodyColor,
    required this.bodyButtonColor,
    required this.bodyButtonTextColor,
    required this.bodyTextColor,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'location_id': locationId,
      'app_bar_color': appBarColor,
      'app_bar_text_color': appBarTextColor,
      'body_color': bodyColor,
      'body_button_color': bodyButtonColor,
      'body_button_text_color': bodyButtonTextColor,
      'body_text_color': bodyTextColor,
    };
  }

  factory ColorManagerModel.fromJson(Map<String, dynamic> json) {
    return ColorManagerModel(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      locationId: json['location_id'] as int,
      appBarColor: json['app_bar_color'] as String,
      appBarTextColor: json['app_bar_text_color'] as String,
      bodyColor: json['body_color'] as String,
      bodyButtonColor: json['body_button_color'] as String,
      bodyButtonTextColor: json['body_button_text_color'] as String,
      bodyTextColor: json['body_text_color'] as String,
    );
  }
}
