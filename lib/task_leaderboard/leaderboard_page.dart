import 'package:flutter/material.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/data.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/top_leaders.dart';
import 'package:flutter_epam_ai_challenge/task_leaderboard/user_item.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Leaderboard'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 4),
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                labelPadding: const EdgeInsets.all(12),
                splashFactory: NoSplash.splashFactory,
                splashBorderRadius: const BorderRadius.all(Radius.circular(12)),
                tabs: const [
                  Text('Region'),
                  Text('National'),
                  Text('Global'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            LeaderboardView(data: leadersData[0]),
            LeaderboardView(data: leadersData[1]),
            LeaderboardView(data: leadersData[2]),
          ],
        ),
      ),
    );
  }
}

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({
    super.key,
    required this.data,
  });

  final List<User> data;

  List<User> get others => data.sublist(3);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 14,
                bottom: 26,
              ),
              child: TopLeaders(
                first: data[0],
                second: data[1],
                third: data[2],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 4
                  )),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                itemCount: others.length,
                itemBuilder: (_, index) => UserListItem(user: others[index]),
                separatorBuilder: (_, index) => const Divider(height: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
