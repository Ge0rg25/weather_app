import 'package:json_annotation/json_annotation.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherData {
  @JsonKey(name: "location")
  final WeatherLocationData location;
  @JsonKey(name: "current")
  final WeatherCurrentData current;

  WeatherData({required this.location, required this.current});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class WeatherLocationData {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;

  WeatherLocationData(this.name, this.region, this.country, this.lat, this.lon);

  factory WeatherLocationData.fromJson(Map<String, dynamic> json) =>
      _$WeatherLocationDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLocationDataToJson(this);
}

@JsonSerializable()
class WeatherCurrentData {
  @JsonKey(name: "temp_c")
  final double tempC;
  @JsonKey(name: "condition")
  final WeatherCondition condition;

  WeatherCurrentData({required this.tempC, required this.condition});

  factory WeatherCurrentData.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherCurrentDataToJson(this);
}

@JsonSerializable()
class WeatherCondition {
  final String text;
  @JsonKey(name: "icon")
  final String iconUrl;
  String get fullIconUrl => "https:$iconUrl";

  WeatherCondition({required this.text, required this.iconUrl});

  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherConditionToJson(this);
}
