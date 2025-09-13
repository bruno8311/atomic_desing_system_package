import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../templates/template_contact_page.dart';

class PageContact extends StatelessWidget {
  const PageContact({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateContactPage(
      headerTitle: 'Inicio',
      headerUserName: 'Bruno',
      headerUserImageUrl:'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop',
      headerShowBackArrow: true,
      headerOnHome: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Home')));
      },
      headerOnLogout: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Logout')));
      },
      descriptiveTitle: 'Contáctanos',
      descriptiveSubtitle:'Email: soporte@ecommerce.com\nTeléfono: +51 999 999 999\n\n¿Tienes alguna consulta?',
      descriptiveButtonText: 'Enviar',
      descriptiveButtonDependsOnText: true,
      descriptiveOnButtonPressed: (text) => ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Se envió el mensaje: $text'))),
      footerIcons: const [Icons.facebook, Icons.email],
      footerLabels: const ['Términos', 'Privacidad'],
      footerActions: [
        () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Términos')));
        },
        () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Privacidad')));
        },
      ],
      footerBackgroundColor: AppColors.background,
    );
  }
}
