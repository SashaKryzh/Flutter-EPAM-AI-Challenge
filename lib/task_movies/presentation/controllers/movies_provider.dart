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

  Future<void> loadData() async {
    _error = '';
    _isLoading = true;
    notifyListeners();

    final result = await _moviesRepository.getMovies();
    result.fold(
      (error) => _error = error,
      (movies) => _movies = movies,
    );

    _isLoading = false;
    notifyListeners();
  }
}
