import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/di.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_model.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/controllers/movies_provider.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/widgets/movie_list_tile.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/widgets/price_filter_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<MoviesProvider>()..loadData(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          actions: const [
            _FilterButton(),
            _SortMenuButton(),
          ],
        ),
        body: Consumer<MoviesProvider>(builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error.isNotEmpty) {
            return Center(
              child: Text(provider.error),
            );
          }

          final movies = provider.filteredMovies;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, index) => MovieListTile(
              movie: movies[index],
              onTap: () => context.go('/movies/${movies[index].id}'),
            ),
          );
        }),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  const _FilterButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final provider = context.read<MoviesProvider>();

        final (minPrice, minAvailable, maxPrice, maxAvailable) = findRange(
          provider.allMovies,
          provider.filter,
        );

        showDialog(
          context: context,
          builder: (_) => PriceFilterDialog(
            min: minPrice,
            minAvailable: minAvailable,
            max: maxPrice,
            maxAvailable: maxAvailable,
            onFilterApplied: (newMin, newMax) => context
                .read<MoviesProvider>()
                .setFilter(min: newMin.toInt(), max: newMax.toInt()),
          ),
        );
      },
      icon: const Icon(Icons.filter_list),
    );
  }

  /// min, minAvailable, max, maxAvailable
  (double, double, double, double) findRange(
    List<Movie> allMovies,
    MoviePriceFilter? filter,
  ) {
    final minAvailable = allMovies
        .reduce((currentMin, movie) {
          return movie.price < currentMin.price ? movie : currentMin;
        })
        .price
        .toDouble();

    final maxAvailable = allMovies
        .reduce((currentMax, movie) {
          return movie.price > currentMax.price ? movie : currentMax;
        })
        .price
        .toDouble();

    final minPrice = max(
      filter?.min.toDouble() ?? 0,
      minAvailable,
    );

    final maxPrice = min(
      filter?.max.toDouble() ?? double.infinity,
      maxAvailable,
    );

    return (minPrice, minAvailable, maxPrice, maxAvailable);
  }
}

class _SortMenuButton extends StatelessWidget {
  const _SortMenuButton();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MovieSorting>(
      icon: const Icon(Icons.sort),
      onSelected: (MovieSorting selectedOption) {
        context.read<MoviesProvider>().setSorting(selectedOption);
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem(
          value: MovieSorting.nameAsc,
          child: Text('Name Ascending'),
        ),
        const PopupMenuItem(
          value: MovieSorting.nameDesc,
          child: Text('Name Descending'),
        ),
        const PopupMenuItem(
          value: MovieSorting.priceAsc,
          child: Text('Price Ascending'),
        ),
        const PopupMenuItem(
          value: MovieSorting.priceDesc,
          child: Text('Price Descending'),
        ),
      ],
    );
  }
}
