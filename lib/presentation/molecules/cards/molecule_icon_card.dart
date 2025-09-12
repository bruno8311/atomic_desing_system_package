import 'package:flutter/material.dart';

import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import '../../atoms/atoms.dart';

/// Card compacto con icono y texto, usando solo átomos
class MoleculeIconCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const MoleculeIconCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AtomCard(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Row(
            children: [
              AtomIcon(
                icon: icon,
                color: iconColor ?? AppColors.primary,
                size: 36,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AtomText(
                      text: title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    AtomText(
                      text: subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                AtomIcon(icon: Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
