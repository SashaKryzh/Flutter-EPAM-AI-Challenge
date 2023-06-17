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

const leadersData = [
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
      avatarUrl: 'assets/avatar2.png',
      score: 1847,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Ruben',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 1674,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Clifford',
      username: '@username',
      avatarUrl: 'assets/avatar4.jpeg',
      score: 1134,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'User1',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 357,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'assets/avatar7.gif',
      score: 8123,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'User23',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Niceeee',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Don"t know',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Jacob666',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
  ],
  [
    User(
      name: 'Niceeee',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Don"t know',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Jacob666',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
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
      avatarUrl: 'assets/avatar2.png',
      score: 1847,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Ruben',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 1674,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Clifford',
      username: '@username',
      avatarUrl: 'assets/avatar4.jpeg',
      score: 1134,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'User1',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 357,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'assets/avatar7.gif',
      score: 8123,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'User23',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
  ],
  [
    User(
      name: 'User23',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'assets/avatar1.jpeg',
      score: 3056,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Clifford',
      username: '@username',
      avatarUrl: 'assets/avatar4.jpeg',
      score: 1134,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'User1',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 357,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Matthew',
      username: '@username',
      avatarUrl: 'assets/avatar2.png',
      score: 1847,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Ruben',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 1674,
      scoreChange: ScoreChange.up,
    ),
    User(
      name: 'Jacob',
      username: '@username',
      avatarUrl: 'assets/avatar7.gif',
      score: 8123,
      scoreChange: ScoreChange.down,
    ),
    User(
      name: 'Niceeee',
      username: '@username',
      avatarUrl: 'assets/avatar3.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Don"t know',
      username: '@username',
      avatarUrl: 'assets/avatar5.png',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
    User(
      name: 'Jacob666',
      username: '@username',
      avatarUrl: 'assets/avatar8.jpeg',
      score: 666,
      scoreChange: ScoreChange.none,
    ),
  ],
];
