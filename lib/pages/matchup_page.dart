import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:versus/models/player.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/custom_card_widget.dart';
import 'package:versus/widgets/dialogs/dialogs.dart'
    show addPlayerDialog; // specify which dialogs should be imported!
import 'package:versus/widgets/player_grid_widget.dart';
import 'package:versus/widgets/player_icon_widget.dart';

class MatchupPage extends StatefulWidget {
  final List<Player> players;
  const MatchupPage({
    super.key,
    // required List<Player> players,
    required this.players,
  });

  @override
  State<MatchupPage> createState() => _MatchupPageState();
}

class _MatchupPageState extends State<MatchupPage> {
  final FirestoreService firestoreService = FirestoreService();

  List<Player> teamOne = [];
  List<Player> teamTwo = [];
  List<Player> playerPool = [];

  @override
  void initState() {
    super.initState();
    playerPool = List<Player>.from(widget.players);
  }

  final TextEditingController textController = TextEditingController();

  bool isTeamFull(List team) {
    if (team.length < 2) {
      return false;
    } else {
      return true;
    }
  }

  void addToMatchup(Player player) {
    if (!isTeamFull(teamOne)) {
      setState(() {
        print('tried adding player to teamOne');
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
  void removeFromTeam(List<Player> team, Player player) {
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

  Widget team(List<Player> team) {
    return CustomCard(
      height: 100,
      width: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: team.length,
        itemBuilder: (context, index) {
          return PlayerIcon(
            display: team[index].name,
            onPressed: () => removeFromTeam(team, team[index]),
          );
        },
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
        child: PlayerGrid(
          players: playerPool,
          onPlayerTap: addToMatchup,
          onAddPressed: () async {
            final newPlayer = await addPlayerDialog(
              context,
              firestoreService,
              textController,
            );

            if (newPlayer != null) {
              setState(() {
                playerPool.insert(0, newPlayer); // Insert at the beginning
              });
            }
          },
        ),
      ),
    );
  }
}
