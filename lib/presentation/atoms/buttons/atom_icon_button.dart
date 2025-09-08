import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class AtomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;

  const AtomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.padding,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: size, color: iconColor ?? AppColors.text),
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.all(8),
    );
  }
}
