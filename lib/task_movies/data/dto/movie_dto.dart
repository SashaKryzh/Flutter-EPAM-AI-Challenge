import 'package:flutter/foundation.dart';

@immutable
class MovieDto {
  final String id;
  final String name;
  final int price;

  const MovieDto({
    required this.id,
    required this.name,
    required this.price,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
