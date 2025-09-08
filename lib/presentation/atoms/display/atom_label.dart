import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class AtomLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const AtomLabel({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? AppTextStyles.subtitle.copyWith(color: AppColors.text),
    );
  }
}
