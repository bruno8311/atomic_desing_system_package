import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';

class AtomInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? style;
  final InputBorder? border;
  final bool enabled;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextAlignVertical? textAlignVertical;

  const AtomInput({
    super.key,
    required this.controller,
    this.hintText,
    this.style,
    this.border,
    this.enabled = true,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.textAlignVertical,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: border,
        suffixIcon: suffixIcon,
      ),
      style: style ?? AppTextStyles.body,
      enabled: enabled,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textAlignVertical: textAlignVertical,
    );
  }
}