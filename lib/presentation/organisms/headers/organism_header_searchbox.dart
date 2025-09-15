import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/presentation/molecules/molecules.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class OrganismHeaderSearchBox extends StatelessWidget {
  final double? userNameFontSize;
  final double? avatarRadius;
  final String imageUrl;
  final String userName;
  final Axis direction;
  final double spacing;
  final String title;
  final MainAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final TextEditingController? searchController;
  final String? searchLabel;
  final IconData? searchIcon;
  final void Function(String)? onSearch;
  final String? hintText;
  final bool showBackArrow;
  final VoidCallback onLogout;
  final VoidCallback onHome;

  const OrganismHeaderSearchBox({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.searchController,
    required this.title,
    required this.onLogout,
    required this.onHome,
    this.direction = Axis.horizontal,
    this.spacing = 16.0,
    this.alignment = MainAxisAlignment.end,
    this.padding,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
    this.searchLabel,
    this.searchIcon,
    this.onSearch,
    this.hintText,
    this.showBackArrow = false,
    this.userNameFontSize,
    this.avatarRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 0,
        right: paddingHorizontal,
        top: paddingVertical,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar y nombre a la izquierda (no crece)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showBackArrow)
                    AtomIconButton(
                      icon: Icons.arrow_back,
                      iconColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                      padding: EdgeInsets.symmetric(horizontal: 0),
                    ),
                  Padding(
                    padding: showBackArrow
                        ? EdgeInsets.only(left: 0)
                        : EdgeInsets.only(left: 20),
                    child: MoleculeAvatarWithName(
                      imageUrl: imageUrl,
                      name: userName,
                      fontSize: userNameFontSize ?? 13,
                      avatarRadius: avatarRadius ?? 17,
                    ),
                  ),
                ],
              ),
              // Título flexible y centrado
              Flexible(
                child: Center(
                  child: AtomLabel(
                    text: title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              // Iconos a la derecha (no crecen)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AtomIconButton(
                    icon: Icons.notifications,
                    iconColor: Colors.white,
                    size: 15,
                    padding: EdgeInsets.zero,
                    spacing: 0,
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
                  AtomIconButton(
                    icon: Icons.home,
                    iconColor: Colors.white,
                    size: 15,
                    padding: EdgeInsets.zero,
                    spacing: 0,
                    onPressed: onHome,
                  ),
                  AtomIconButton(
                    icon: Icons.logout,
                    iconColor: Colors.white,
                    size: 15,
                    padding: EdgeInsets.zero,
                    spacing: 0,
                    onPressed: () {
                      MoleculeConfirmModal.show(
                        context: context,
                        title: '¿Desea cerrar sesión?',
                        message:
                            'Confirme si desea cerrar sesión en la aplicación.',
                        confirmText: 'Confirmar',
                        cancelText: 'Cancelar',
                        onConfirm: () {
                          Navigator.of(context).pop();
                          onLogout();
                        },
                        onCancel: () {},
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.only(left: paddingHorizontal),
            child: MoleculeSearchBar(
              label: searchLabel,
              controller: searchController ?? TextEditingController(),
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
