import 'package:flutter/material.dart';

@immutable
class MovieDetailDto {
  final String image;
  final String meta;
  final String name;
  final int price;
  final String rating;
  final String synopsis;

  const MovieDetailDto({
    required this.image,
    required this.meta,
    required this.name,
    required this.price,
    required this.rating,
    required this.synopsis,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      image: json['image'],
      meta: json['meta'],
      name: json['name'],
      price: json['price'],
      rating: json['rating'],
      synopsis: json['synopsis'],
    );
  }
}
