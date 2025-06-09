import 'package:flutter/material.dart';
import 'package:fudiko/utils/constants.dart';

class AppText extends StatelessWidget {

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;
  final bool? isCentered;
  final double? lineSpacing;

  const AppText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    this.color,
    this.isCentered,
    this.lineSpacing
  });

  @override
  Widget build(BuildContext context) {
    return Text(

      text,
      textAlign: isCentered ?? false ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ??appTextColor,
        height: lineSpacing ?? 1.0
      )
    );
  }
}