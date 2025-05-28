import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/custom_card_widget.dart';
import 'package:versus/widgets/player_icon_widget.dart';

class TestPage extends StatelessWidget {
  List<String> myList = [
    'Elias',
    'Leopold',
    'Claire',
    'Yanick',
    'Elias',
    'Leopold',
    'Claire',
    'Yanick',
    'Elias',
    'Leopold',
    'Claire',
    'Yanick',
    'Elias',
    'Leopold',
    'Claire',
    'Yanick',
  ];

  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.background),
      backgroundColor: AppColors.background,
      body: Align(
        alignment: Alignment.topCenter,
        child: CustomCard(
          height: 500,
          width: 370,
          child: SizedBox(
            height: 400,
            width: 350,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return PlayerIcon(display: myList[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
