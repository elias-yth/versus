import 'package:flutter/material.dart';
import 'package:versus/models/player.dart';
import 'package:versus/pages/matchup_page.dart';
import 'package:versus/services/firestore.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _firestoreService = FirestoreService();
  List<Player>? _players;

  @override
  void initState() {
    super.initState();
    _loadPlayersOnce();
  }

  Future<void> _loadPlayersOnce() async {
    try {
      final stream = _firestoreService.getPlayersStream();
      final firstSnapshot = await stream.first;
      if (mounted) {
        setState(() {
          _players = firstSnapshot;
        });
      }
    } catch (e) {
      // print('Error loading players: $e');
    }
  }

  void _onGetStartedPressed() {
    if (_players == null) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MatchupPage(players: _players!)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              H1('VERSUS'),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: BigButton(
                    color: AppColors.secondary,
                    onPressed: _onGetStartedPressed,
                    child: H3('get started'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
