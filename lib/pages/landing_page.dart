import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';
import 'package:versus/widgets/big_button_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/matchup');
                    },
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
