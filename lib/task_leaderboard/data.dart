import 'package:flutter/material.dart';

enum ScoreChange {
  up,
  down,
  none,
}

@immutable
class User {
  const User({
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.score,
    required this.scoreChange,
  });

  final String name;
  final String username;
  final String avatarUrl;
  final int score;
  final ScoreChange scoreChange;
}

const data = [
  [
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'assets/avatar1.jpeg',
      score: 3056,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Matthew',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 1847,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Ruben',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 1674,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Clifford',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 1134,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'User1',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 357,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 8123,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Jacob666',
      username: '@username',
      avatarUrl: 'avatarUrl',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
  ],
];
