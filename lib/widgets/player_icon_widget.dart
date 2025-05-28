import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';

class PlayerIcon extends StatelessWidget {
  final String display;
  final Widget? child;
  const PlayerIcon({super.key, required this.display, this.child});

  @override
  Widget build(BuildContext context) {
    double iconHeight = 50;
    double subTextHeight = 20;
    double totalHeight = iconHeight + subTextHeight;

    return TextButton(
      onPressed: () {
        // func
      },
      child: SizedBox(
        height: totalHeight,
        width: 70,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                child: H4(display[0]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(height: 20, child: P(display)),
            ),
          ],
        ),
      ),
    );
  }
}
