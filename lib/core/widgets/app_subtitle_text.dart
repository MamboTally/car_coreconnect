import 'package:car_coreconnect/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppSubtitleText extends StatelessWidget {
  const AppSubtitleText(this.text, {super.key, this.color});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.grayColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}