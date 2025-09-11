import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class AtomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final Color? iconColor;
  final double spacing;
  final BoxConstraints? constraints;
  final VisualDensity? visualDensity;

  const AtomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size,
    this.padding,
    this.iconColor,
    this.spacing = 0,
    this.constraints,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, size: size, color: iconColor ?? AppColors.text),
          onPressed: onPressed,
          padding: padding ?? EdgeInsets.zero,
          constraints: constraints ?? const BoxConstraints(),
          visualDensity: visualDensity ?? VisualDensity.compact,
        ),
        if (spacing > 0) SizedBox(width: spacing),
      ],
    );
  }
}
