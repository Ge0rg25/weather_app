// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      location: WeatherLocationData.fromJson(
          json['location'] as Map<String, dynamic>),
      current:
          WeatherCurrentData.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
    };

WeatherLocationData _$WeatherLocationDataFromJson(Map<String, dynamic> json) =>
    WeatherLocationData(
      json['name'] as String,
      json['region'] as String,
      json['country'] as String,
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherLocationDataToJson(
        WeatherLocationData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
    };

WeatherCurrentData _$WeatherCurrentDataFromJson(Map<String, dynamic> json) =>
    WeatherCurrentData(
      tempC: (json['temp_c'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherCurrentDataToJson(WeatherCurrentData instance) =>
    <String, dynamic>{
      'temp_c': instance.tempC,
      'condition': instance.condition,
    };

WeatherCondition _$WeatherConditionFromJson(Map<String, dynamic> json) =>
    WeatherCondition(
      text: json['text'] as String,
      iconUrl: json['icon'] as String,
    );

Map<String, dynamic> _$WeatherConditionToJson(WeatherCondition instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.iconUrl,
    };
