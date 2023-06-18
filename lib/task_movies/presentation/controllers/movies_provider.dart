import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_model.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/repositories/movies_repository.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider(this._moviesRepository);

  final MoviesRepository _moviesRepository;

  List<Movie> _allMovies = [];
  List<Movie> get allMovies => List.unmodifiable(_allMovies);

  List<Movie> get filteredMovies {
    final filteredMovies = [..._allMovies];

    if (_filter != null) {
      filteredMovies.removeWhere((movie) => !_filter!.isInRange(movie.price));
    }

    if (_sorting != null) {
      filteredMovies.sort(_sorting!.compare);
    }

    return List.unmodifiable(filteredMovies);
  }

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

    final result = await _moviesRepository.getMovies();

    result.fold(
      (error) => _error = error,
      (movies) => _allMovies = movies,
    );

    _isLoading = false;
    notifyListeners();
  }

  void setSorting(MovieSorting? sorting) {
    _sorting = sorting;
    notifyListeners();
  }

  void setFilter({required int min, required int max}) {
    _filter = MoviePriceFilter(min: min, max: max);
    notifyListeners();
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

@immutable
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
