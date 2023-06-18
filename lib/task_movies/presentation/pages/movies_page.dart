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
          actions: [
            IconButton(
              onPressed: () {
                final provider = context.read<MoviesProvider>();

                final minAvailable =
                    provider.movies.reduce((currentMin, movie) {
                  return movie.price < currentMin.price ? movie : currentMin;
                });

                final maxAvailable =
                    provider.movies.reduce((currentMax, movie) {
                  return movie.price > currentMax.price ? movie : currentMax;
                });

                final minPrice = max(
                  provider.filter?.min.toDouble() ?? 0,
                  minAvailable.price.toDouble(),
                );

                final maxPrice = min(
                  provider.filter?.max.toDouble() ?? double.infinity,
                  maxAvailable.price.toDouble(),
                );

                showDialog(
                  context: context,
                  builder: (_) => PriceFilterDialog(
                    min: minPrice,
                    minAvailable: minAvailable.price.toDouble(),
                    max: maxPrice,
                    maxAvailable: maxAvailable.price.toDouble(),
                    onFilterApplied: (minPrice, maxPrice) =>
                        context.read<MoviesProvider>().setFilter(
                              min: minPrice.toInt(),
                              max: maxPrice.toInt(),
                            ),
                  ),
                );
              },
              icon: const Icon(Icons.filter_list),
            ),
            PopupMenuButton<MovieSorting>(
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
            ),
          ],
        ),
        body: Consumer<MoviesProvider>(builder: (context, provider, __) {
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

          return ListView.builder(
            itemCount: provider.movies.length,
            itemBuilder: (_, index) => MovieListTile(
              movie: provider.movies[index],
              onTap: () => context.go('/movies/${provider.movies[index].id}'),
            ),
          );
        }),
      ),
    );
  }
}
