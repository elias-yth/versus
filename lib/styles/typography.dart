import 'package:flutter/material.dart';
import 'package:versus/styles/colors.dart';

class H1 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  const H1(this.text, {this.textAlign, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(fontSize: 110, color: color ?? AppColors.primary),
    );
  }
}

class H2 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  const H2(this.text, {this.textAlign, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(fontSize: 90, color: color ?? AppColors.primary),
    );
  }
}

class H3 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  const H3(this.text, {this.textAlign, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(fontSize: 50, color: color ?? AppColors.primary),
    );
  }
}

class H4 extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;

  const H4(this.text, {this.textAlign, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(fontSize: 40, color: color ?? AppColors.text),
    );
  }
}

class P extends StatelessWidget {
  final String text;
  final Color? color;

  const P(this.text, {this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 22, color: color ?? AppColors.text),
    );
  }
}
