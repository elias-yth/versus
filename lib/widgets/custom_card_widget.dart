import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final Widget? child;

  const CustomCard({
    super.key,
    required this.height,
    required this.width,
    this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ?? AppColors.cardBackground,
      ),
      child: child,
    );
  }
}
