import 'package:flutter/material.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/custom_card_widget.dart';
import 'package:versus/widgets/dialogs/dialogs.dart'
    show addPlayerDialog; // specify which dialogs should be imported!
import 'package:versus/widgets/player_icon_widget.dart';

class MatchupPage extends StatefulWidget {
  const MatchupPage({super.key});

  @override
  State<MatchupPage> createState() => _MatchupPageState();
}

class _MatchupPageState extends State<MatchupPage> {
  final FirestoreService firestoreService = FirestoreService();

  List<String> teamOne = [];
  List<String> teamTwo = [];
  List<String> playerPool = [
    'Jette',
    'Fenchel',
    'Linne',
    'Leopold',
    'Luke',
    'Elias',
  ];

  final TextEditingController textController = TextEditingController();

  bool isTeamFull(List team) {
    if (team.length < 2) {
      return false;
    } else {
      return true;
    }
  }

  void addToMatchup(String player) {
    if (!isTeamFull(teamOne)) {
      setState(() {
        teamOne.add(player);
        playerPool.remove(player);
      });
    } else if (!isTeamFull(teamTwo)) {
      setState(() {
        teamTwo.add(player);
        playerPool.remove(player);
      });
    } else {
      print('team already full');
    }
  }

  // TODO: ADD PLAYER TO START OF PLAYERPOOL LIST
  void removeFromTeam(List team, String player) {
    setState(() {
      playerPool.add(player);
      team.remove(player);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // CURRENT TEAM DISPLAY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [team(teamOne), H3('VS'), team(teamTwo)],
                ),
                const SizedBox(height: 10),

                // PLAYER POOL
                playerSelection(),
              ],
            ),

            // START MATCH BUTTON
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: BigButton(
                // TODO: update 'lastPlayed' property for players in teamOne and teamTwo
                onPressed: () {
                  Navigator.pushNamed(context, '/test');
                },
                child: H3('start match'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget team(List team) {
    return CustomCard(
      height: 80,
      width: 160,
      child: SizedBox(
        // height: 90,
        // width: 100,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: team.length,
          itemBuilder: (context, index) {
            return PlayerIcon(
              display: team[index],
              size: 44,
              onPressed: () => removeFromTeam(team, team[index]),
            );
          },
        ),
      ),
    );
  }

  Widget playerSelection() {
    return CustomCard(
      height: 300,
      width: 500,
      child: SizedBox(
        height: 400,
        width: 350,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: playerPool.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return PlayerIcon(
                display: '+',
                onPressed:
                    () => addPlayerDialog(
                      context,
                      firestoreService,
                      textController,
                    ),
              );
            } else {
              return PlayerIcon(
                display: playerPool[index - 1],
                // size: 40,
                onPressed: () => addToMatchup(playerPool[index - 1]),
              );
            }
          },
        ),
      ),
    );
  }
}
