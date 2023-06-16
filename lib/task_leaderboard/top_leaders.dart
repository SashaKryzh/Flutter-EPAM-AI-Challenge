import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/user_item.dart';

import 'data.dart';

enum _Place {
  first(Colors.orangeAccent),
  second(Colors.blueAccent),
  third(Colors.greenAccent);

  const _Place(this.color);

  final Color color;
}

class TopLeaders extends StatelessWidget {
  const TopLeaders({
    super.key,
    required this.first,
    required this.second,
    required this.third,
  });

  final User first;
  final User second;
  final User third;

  @override
  Widget build(BuildContext context) {
    const height1 = 159.0;
    const height2 = 113.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: height2,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: _Info(
                    user: second,
                    place: _Place.second,
                  ),
                ),
              ),
              Positioned(
                top: -30,
                child: UserAvatar(
                  second.avatarUrl,
                  borderColor: _Place.second.color,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: height1,
                child: Center(
                  child: _Info(
                    user: first,
                    place: _Place.first,
                  ),
                ),
              ),
              Positioned(
                top: -55,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/crown.png',
                      width: 30,
                    ),
                    UserAvatar(
                      first.avatarUrl,
                      borderColor: _Place.first.color,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                height: height2,
                child: Center(
                  child: _Info(
                    user: third,
                    place: _Place.third,
                  ),
                ),
              ),
              Positioned(
                top: -30,
                child: UserAvatar(
                  third.avatarUrl,
                  borderColor: _Place.third.color,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    required this.user,
    required this.place,
  });

  final User user;
  final _Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          user.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.score.toString(),
          style: TextStyle(
            color: place.color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(user.username),
      ],
    );
  }
}
