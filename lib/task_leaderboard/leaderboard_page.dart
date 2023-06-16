import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/data.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/top_leaders.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/user_item.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final d = data[0];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopLeaders(
            first: d[0],
            second: d[1],
            third: d[2],
          ),
          UserListItem(
            user: data.first.first,
          ),
        ],
      ),
    );
  }
}
