import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/router.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter EPAM AI Challenge',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FilledButton(
                onPressed: () => context.go('/leaderboard'),
                child: const Text('Leaderboard'),
              ),
              FilledButton(
                onPressed: () => context.go('/movies'),
                child: const Text('Movies'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
