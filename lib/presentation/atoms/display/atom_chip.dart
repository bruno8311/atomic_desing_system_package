import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';
import 'atom_text.dart';

class AtomChip extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const AtomChip({
    super.key,
    required this.label,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: AtomText(
        text: label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor ?? AppColors.primary,
        ),
      ),
    );
  }
}
