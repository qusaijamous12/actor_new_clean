import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/app_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.fontWeight,
    this.fontColor,
    this.fontSize,
    this.maxLines,
    this.textOverflow
  });

  final String title;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final int ?maxLines;
  final TextOverflow ?textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow:textOverflow ,
      style: GoogleFonts.actor(
        fontSize: fontSize ?? AppFontSize.fs16,
        color: fontColor ?? Colors.white,
        fontWeight: fontWeight ?? AppFontWeight.w400,

      ),
    );
  }
}
