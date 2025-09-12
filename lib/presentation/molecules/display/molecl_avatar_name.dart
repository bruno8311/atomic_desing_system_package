import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class MoleculeAvatarWithName extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Color? textColor;
  final double? fontSize;
  final double? avatarRadius;
  const MoleculeAvatarWithName({
    super.key,
    required this.imageUrl,
    required this.name,
    this.textColor,
    this.fontSize,
    this.avatarRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AtomAvatar(imageUrl: imageUrl, radius: avatarRadius ?? 24),
        const SizedBox(width: 8),
        AtomLabel(
          text: name,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontSize: fontSize ?? 16,
          ),
        ),
      ],
    );
  }
}
