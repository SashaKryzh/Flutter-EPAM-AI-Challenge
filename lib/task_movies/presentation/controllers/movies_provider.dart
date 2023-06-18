import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_model.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/repositories/movies_repository.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  List<Movie> _movies = [];
  List<Movie> get movies => List.unmodifiable(_movies);

  String _error = '';
  String get error => _error;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  MovieSorting? _sorting;
  MovieSorting? get sorting => _sorting;

  MoviePriceFilter? _filter;
  MoviePriceFilter? get filter => _filter;

  Future<void> loadData() async {
    _error = '';
    _isLoading = true;
    notifyListeners();

    final result = await _moviesRepository.getMovies(
      sorting: _sorting,
      filter: _filter,
    );

    result.fold(
      (error) => _error = error,
      (movies) => _movies = movies,
    );

    _isLoading = false;
    notifyListeners();
  }

  void setSorting(MovieSorting? sorting) {
    _sorting = sorting;
    loadData();
  }

  void setFilter({
    required int min,
    required int max,
  }) {
    _filter = MoviePriceFilter(min: min, max: max);
    loadData();
  }
}
