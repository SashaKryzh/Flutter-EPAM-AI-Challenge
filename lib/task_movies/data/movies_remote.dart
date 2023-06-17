import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_epam_ai_challenge/task_movies/data/movie_dto.dart';

class MoviesRemoteDataSource {
  MoviesRemoteDataSource(this._client);

  final http.Client _client;

  Future<List<MovieDto>> getMovies() async {
    final response = await _client.get(Uri.parse(
      'https://us-central1-temporary-692af.cloudfunctions.net/movies',
    ));

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => MovieDto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
