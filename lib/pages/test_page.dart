import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/player_icon_widget.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  void addPlayer(String player) {
    if (matchup.length < 4) {
      setState(() {
        matchup.add(player);
        playerPool.remove(player);
      });
    } else {
      print('team already full');
    }
  }

  void removePlayer(String player) {
    setState(() {
      matchup.add(player);
      playerPool.remove(player);
    });
  }

  List<String> matchup = ['Josh'];

  List<String> playerPool = [
    'Elias',
    'Luke',
    'Fenchel',
    'Luca',
    'Linne',
    'Leopold',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: H2('TESTPAGE'),
      ),
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: playerPool.length,
              itemBuilder: (context, index) {
                return PlayerIcon(
                  display: playerPool[index],
                  onPressed: () => addPlayer(playerPool[index]),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: matchup.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(matchup[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
