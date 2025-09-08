import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';

class MoleculeAvatarWithName extends StatelessWidget {
  final String imageUrl;
  final String name;
  final Color? textColor;
  const MoleculeAvatarWithName({super.key, required this.imageUrl, required this.name, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AtomAvatar(imageUrl: imageUrl),
        const SizedBox(width: 8),
        AtomLabel(
          text: name,
          style: TextStyle(
            color: textColor ?? Theme.of(context).colorScheme.onPrimary,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
