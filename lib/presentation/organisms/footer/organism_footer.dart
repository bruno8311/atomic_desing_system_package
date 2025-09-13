import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:flutter/material.dart';
import '../../molecules/molecules.dart';

class OrganismFooter extends StatelessWidget {
  final String? copyright;
  final List<IconData>? icons;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final List<String> labels;
  final List<VoidCallback> actions;

  const OrganismFooter({
    super.key,
    this.copyright,
    this.icons,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
    this.labels = const [],
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icons != null && icons!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: icons!
                  .map(
                    (icon) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(icon, color: AppColors.primary),
                    ),
                  )
                  .toList(),
            ),
          const SizedBox(height: 12),
          MoleculeActionButtons(
            labels: labels,
            actions: actions,
            direction: Axis.horizontal,
            spacing: 8,
            alignment: MainAxisAlignment.center,
          ),
          if (copyright != null) ...[
            const SizedBox(height: 12),
            AtomText(
              text: copyright!,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}
