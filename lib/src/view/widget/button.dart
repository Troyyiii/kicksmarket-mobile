import 'package:flutter/material.dart';
import 'package:kicksmarket/src/constants/color_palettes.dart';

class Button extends StatelessWidget {
  final String title;
  final double? fontSize;
  final double? letterSpacing;
  final Function()? onTap;

  const Button({
    super.key,
    required this.title,
    this.onTap,
    this.letterSpacing,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap ?? () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Palette.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? 12.0,
          color: Palette.white,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
