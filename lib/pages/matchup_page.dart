import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';
import 'package:versus/widgets/custom_card_widget.dart';

class MatchupPage extends StatelessWidget {
  const MatchupPage({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomCard(height: 100, width: 150),
                    H2('VS'),
                    CustomCard(height: 100, width: 150),
                  ],
                ),
                SizedBox(height: 20),
                CustomCard(height: 200, width: 370),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: BigButton(onPressed: () {}, child: H3('start match')),
            ),
          ],
        ),
      ),
    );
  }
}
