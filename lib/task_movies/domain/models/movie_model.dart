import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_epam_ai_challenge/task_movies/data/movie_dto.dart';

@immutable
class Movie extends Equatable {
  final String id;
  final String name;
  final int price;

  const Movie({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, price];
}

extension MovieMappers on MovieDto {
  Movie toModel() {
    return Movie(
      id: id,
      name: name,
      price: price,
    );
  }
}
