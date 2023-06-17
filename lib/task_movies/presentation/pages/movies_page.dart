import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/di.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/controllers/movies_provider.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/widgets/movie_list_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<MoviesProvider>()..loadData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
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
