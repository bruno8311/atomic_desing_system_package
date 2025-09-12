import 'package:flutter/material.dart';
import '../../molecules/display/molecl_avatar_name.dart';

class OrganismHeaderIcon extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final IconData? icon;
  final VoidCallback? onIconPressed;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;

  const OrganismHeaderIcon({
    super.key,
    required this.imageUrl,
    required this.userName,
    this.icon,
    this.onIconPressed,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
      ),
      child: Row(
        children: [
          MoleculeAvatarWithName(imageUrl: imageUrl, name: userName),
          const Spacer(),
          if (icon != null)
            IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 28,
              ),
              onPressed: onIconPressed,
              tooltip: 'Acción',
            ),
        ],
      ),
    );
  }
}
