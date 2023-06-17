import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/data.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAvatar(user.avatarUrl),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4),
              Text(user.username),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              user.score.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            _ScoreChangeIcon(user.scoreChange),
          ],
        )
      ],
    );
  }
}

class _ScoreChangeIcon extends StatelessWidget {
  const _ScoreChangeIcon(this.scoreChange);

  final ScoreChange scoreChange;

  @override
  Widget build(BuildContext context) {
    const iconSize = 24.0;

    switch (scoreChange) {
      case ScoreChange.up:
        return const Icon(
          Icons.arrow_drop_up,
          color: Colors.green,
          size: iconSize,
        );
      case ScoreChange.down:
        return const Icon(
          Icons.arrow_drop_down,
          color: Colors.red,
          size: iconSize,
        );
      case ScoreChange.none:
        return const SizedBox(height: iconSize);
    }
  }
}

class UserAvatar extends StatelessWidget {
  const UserAvatar(
    this.imageUrl, {
    super.key,
    this.radius = 24,
    this.borderColor,
  });

  final String imageUrl;
  final double radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    var result = CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: ClipOval(
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          width: radius * 2,
          height: radius * 2,
        ),
      ),
    );

    if (borderColor != null) {
      result = CircleAvatar(
        radius: radius + 3,
        backgroundColor: borderColor,
        child: result,
      );
    }

    return result;
  }
}
