import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/presentation/molecules/molecules.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class OrganismHeader extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final Axis direction;
  final double spacing;
  final MainAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final TextEditingController? searchController;
  final String? searchLabel;
  final IconData? searchIcon;
  final VoidCallback? onSearch;
  final String? hintText;
  final bool showBackArrow;

  const OrganismHeader({
    super.key,
    required this.imageUrl,
    required this.userName,
    this.direction = Axis.horizontal,
    this.spacing = 16.0,
    this.alignment = MainAxisAlignment.end,
    this.padding,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
    this.searchController,
    this.searchLabel,
    this.searchIcon,
    this.onSearch,
    this.hintText,
    this.showBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: paddingHorizontal,
        right: paddingHorizontal,
        top: paddingVertical + 16,
        bottom: paddingVertical,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (showBackArrow) ...[
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 8),
              ],
              MoleculeAvatarWithName(
                imageUrl: imageUrl,
                name: userName,
              ),
              const Spacer(),
              AtomIconButton(
                icon: Icons.notifications,
                iconColor: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Notificaciones'),
                      content: const Text('Aquí irían las notificaciones.'),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (searchController != null)
            Padding(
              padding: EdgeInsets.only(left: paddingHorizontal),
              child: MoleculeSearchBar(
                label: searchLabel,
                controller: searchController!,
                icon: searchIcon ?? Icons.search,
                onSearch: onSearch,
                hintText: hintText,
              ),
            ),
        ],
      ),
    );
  }
}
