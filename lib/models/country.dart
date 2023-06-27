import 'dart:convert';

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String country;
  final String name;
  final String lat;
  final String lng;

  const Country({
    required this.country,
    required this.name,
    required this.lat,
    required this.lng,
  });

  Country copyWith({
    String? country,
    String? name,
    String? lat,
    String? lng,
  }) {
    return Country(
      country: country ?? this.country,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  @override
  List<Object> get props => [country, name, lat, lng];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'name': name,
      'lat': lat,
      'lng': lng,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      country: map['country'] as String,
      name: map['name'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
