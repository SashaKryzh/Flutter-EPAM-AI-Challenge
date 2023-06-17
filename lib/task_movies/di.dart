import 'package:flutter_epam_ai_challenge/task_movies/data/movies_remote.dart';
import 'package:flutter_epam_ai_challenge/task_movies/domain/repositories/movies_repository.dart';
import 'package:flutter_epam_ai_challenge/task_movies/presentation/controllers/movies_provider.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => MoviesRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => MoviesRepository(getIt()));
  getIt.registerFactory(() => MoviesProvider(getIt()));
}
