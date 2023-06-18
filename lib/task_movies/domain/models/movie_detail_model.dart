import 'package:equatable/equatable.dart';
import 'package:flutter_epam_ai_challenge/task_movies/data/dto/movie_detail_dto.dart';

class MovieDetail extends Equatable {
  final String image;
  final List<String> meta;
  final String name;
  final int price;
  final List<String> rating;
  final String synopsis;

  const MovieDetail({
    required this.image,
    required this.meta,
    required this.name,
    required this.price,
    required this.rating,
    required this.synopsis,
  });

  @override
  List<Object?> get props => [image, meta, name, price, rating, synopsis];
}

extension MovieDetailMappers on MovieDetailDto {
  MovieDetail toModel() {
    return MovieDetail(
      image: image,
      meta: meta.split(',').map((item) => item.trim()).toList(),
      name: name,
      price: price,
      rating: rating.split(',').map((item) => item.trim()).toList(),
      synopsis: synopsis,
    );
  }
}
