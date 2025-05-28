import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';

class BigButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onPressed;
  final Widget? child;

  const BigButton({super.key, this.color, required this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
