import 'package:equatable/equatable.dart';
import 'package:flutter_epam_ai_challenge/task_movies/data/movie_dto.dart';

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

enum MovieSorting {
  nameAsc,
  nameDesc,
  priceAsc,
  priceDesc;

  int compare(Movie a, Movie b) {
    switch (this) {
      case MovieSorting.nameAsc:
        return a.name.compareTo(b.name);
      case MovieSorting.nameDesc:
        return b.name.compareTo(a.name);
      case MovieSorting.priceAsc:
        return a.price.compareTo(b.price);
      case MovieSorting.priceDesc:
        return b.price.compareTo(a.price);
    }
  }
}

class MoviePriceFilter {
  final int min;
  final int max;

  const MoviePriceFilter({
    required this.min,
    required this.max,
  });

  bool isInRange(int price) {
    return price >= min && price <= max;
  }
}
