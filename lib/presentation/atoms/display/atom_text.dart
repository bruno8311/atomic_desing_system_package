import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';

class AtomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  const AtomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.fontSize,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? finalStyle = style ?? AppTextStyles.body;
    if (fontSize != null) {
      finalStyle = finalStyle.copyWith(fontSize: fontSize);
    }
    return Text(
      text,
      style: finalStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
