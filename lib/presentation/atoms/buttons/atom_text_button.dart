import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';

class AtomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const AtomTextButton({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: Text(label, style: textStyle ?? AppTextStyles.button),
    );
  }
}
