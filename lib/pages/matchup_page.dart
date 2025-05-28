import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/custom_card_widget.dart';
import 'package:versus/widgets/player_icon_widget.dart';

class MatchupPage extends StatelessWidget {
  List<String> myList = [
    'Elias',
    'Leopold',
    'Fenchel',
    'Jette',
    'Luke',
    'Luca',
    'Linne',
    'Yanick',
    'Danylo',
    'Emily',
  ];

  MatchupPage({super.key});

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
              children: [teams(), SizedBox(height: 20), playerSelection()],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: BigButton(
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

  Widget teams() {
    return CustomCard(height: 100, width: 370);
  }

  Widget playerSelection() {
    return CustomCard(
      height: 500,
      width: 370,
      child: SizedBox(
        height: 400,
        width: 350,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: myList.length,
          itemBuilder: (context, index) {
            return PlayerIcon(display: myList[index]);
          },
        ),
      ),
    );
  }
}
