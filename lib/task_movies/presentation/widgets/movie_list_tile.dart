import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_model.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({super.key, required this.movie, this.onTap});

  final Movie movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.movie),
      title: Text(movie.name),
      subtitle: Text('Price: \$${movie.price.toString()}'),
      trailing: Text('ID: ${movie.id}'),
      onTap: onTap,
    );
  }
}
