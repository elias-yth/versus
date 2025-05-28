import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';
import 'package:versus/styles/typography.dart';

class PlayerIcon extends StatelessWidget {
  final String display;
  final VoidCallback onPressed;
  final double? size;
  final Widget? child;
  const PlayerIcon({
    super.key,
    required this.display,
    this.child,
    required this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    double iconSize = size ?? 50;
    double subTextHeight = 20;
    double totalHeight = iconSize + subTextHeight;

    return TextButton(
      // TODO: find solution for add button
      onPressed: onPressed,
      child: SizedBox(
        height: totalHeight,
        width: iconSize,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: iconSize,
                width: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.background,
                ),
                child:
                    display == '+' || display == 'add'
                        ? H4('+', color: Colors.blueAccent)
                        : H4(display[0]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 20,
                child:
                    display == '+' || display == 'add'
                        ? P('add', color: Colors.blueAccent)
                        : P(display),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
