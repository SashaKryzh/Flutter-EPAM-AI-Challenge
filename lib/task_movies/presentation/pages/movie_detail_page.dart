import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_movies/di.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/models/movie_detail_model.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/repositories/movies_repository.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movieId});

  final String movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late var future = getIt<MoviesRepository>().getMovieDetail(widget.movieId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text('No data'),
            );
          }

          return snapshot.data!.fold(
            (l) => Center(
              child: Text(l),
            ),
            (r) => _MovieDetailContent(movieDetail: r),
          );
        },
      ),
    );
  }
}

class _MovieDetailContent extends StatelessWidget {
  const _MovieDetailContent({required this.movieDetail});

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            imageUrl: movieDetail.image,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          movieDetail.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text.rich(
          TextSpan(
            text: 'Price: ',
            children: [
              TextSpan(
                text: '${movieDetail.price}\$',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'About',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Wrap(
          spacing: 8,
          children:
              movieDetail.meta.map((item) => Chip(label: Text(item))).toList(),
        ),
        const SizedBox(height: 8),
        Text(
          'Rating',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Wrap(
          spacing: 8,
          children: movieDetail.rating
              .map((item) => Chip(label: Text(item)))
              .toList(),
        ),
        const SizedBox(height: 16),
        Text('Synopsis: ${movieDetail.synopsis}'),
        const SizedBox(height: 48),
      ],
    );
  }
}
