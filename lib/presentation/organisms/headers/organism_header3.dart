import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/presentation/molecules/molecules.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';

class OrganismHeaderWithoutSearch extends StatelessWidget {
  final double? userNameFontSize;
  final double? avatarRadius;
  final String imageUrl;
  final String userName;
  final Axis direction;
  final double spacing;
  final MainAxisAlignment alignment;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final String title;
  final bool showBackArrow;
  final VoidCallback onLogout;
  final VoidCallback? onHome;

  const OrganismHeaderWithoutSearch({
    super.key,
    required this.imageUrl,
    required this.userName,
    this.userNameFontSize,
    this.avatarRadius,
    this.direction = Axis.horizontal,
    this.spacing = 16.0,
    this.alignment = MainAxisAlignment.end,
    this.padding,
    this.backgroundColor,
    this.paddingHorizontal = 16,
    this.paddingVertical = 12,
    required this.title,
    this.showBackArrow = false,
    required this.onLogout,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 0,
        top: paddingVertical,
        right: paddingHorizontal,
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                      size: 20,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AtomIconButton(
                    icon: Icons.notifications,
                    iconColor: Colors.white,
                    size: 18,
                    padding: EdgeInsets.zero,
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
                    size: 18,
                    padding: EdgeInsets.zero,
                    onPressed: onHome,
                  ),
                  AtomIconButton(
                    icon: Icons.logout,
                    iconColor: Colors.white,
                    size: 18,
                    padding: EdgeInsets.zero,
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
          Center(
            child: AtomLabel(
              text: title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
              // Si AtomLabel no soporta overflow, reemplazar por AtomText o Text
            ),
          ),
        ],
      ),
    );
  }
}
