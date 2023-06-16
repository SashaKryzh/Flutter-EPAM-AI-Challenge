import 'package:flutter_epam_ai_challenge/main.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/leaderboard_page.dart';
import 'package:flutter_epam_ai_challenge/task_movies/movies_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (_, __) => const LeaderboardPage(),
    ),
    GoRoute(
      path: '/movies',
      builder: (_, __) => const MoviesPage(),
    ),
  ],
);
