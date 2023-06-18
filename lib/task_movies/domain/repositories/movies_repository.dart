import 'package:dartz/dartz.dart';
import 'package:flutter_epam_ai_challenge/task_movies/data/movies_remote.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_detail_model.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_model.dart';

class MoviesRepository {
  MoviesRepository(this._remote);

  final MoviesRemoteDataSource _remote;

  Future<Either<String, List<Movie>>> getMovies() async {
    try {
      final moviesDto = await _remote.getMovies();
      var movies = moviesDto.map((e) => e.toModel()).toList();
      return Right(movies);
    } catch (e) {
      return Left('Failed to load movies: $e');
    }
  }

  Future<Either<String, MovieDetail>> getMovieDetail(String id) async {
    try {
      final movieDetailDto = await _remote.getMovieDetail(id);
      final movieDetail = movieDetailDto.toModel();
      return Right(movieDetail);
    } catch (e) {
      return Left('Failed to get movie detail: $e');
    }
  }
}
