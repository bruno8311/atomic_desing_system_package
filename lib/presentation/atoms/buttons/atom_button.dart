import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';

enum AtomButtonType { primary, danger, success }

class AtomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final double borderRadius;
  final double elevation;
  final TextStyle? textStyle;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final AtomButtonType type;

  const AtomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.color,
    this.borderRadius = 16,
    this.elevation = 2,
    this.textStyle,
    this.textColor,
    this.padding,
    this.type = AtomButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color resolvedColor =
        color ??
        () {
          switch (type) {
            case AtomButtonType.danger:
              return AppColors.danger;
            case AtomButtonType.success:
              return AppColors.success;
            case AtomButtonType.primary:
              return AppColors.primary;
          }
        }();
    Color resolvedTextColor = textColor ?? AppColors.textLight;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: resolvedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
      child: Text(
        label,
        style: (textStyle ?? AppTextStyles.button).copyWith(
          color: resolvedTextColor,
        ),
      ),
    );
  }
}
