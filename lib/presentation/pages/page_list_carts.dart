import 'package:flutter/material.dart';
import '../templates/template_list_carts.dart';

class PageListCartsTemplate extends StatelessWidget {
  const PageListCartsTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateListCarts(
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
        ).showSnackBar(SnackBar(content: Text('Logout')));
      },
      headerTitle: 'Inicio',
      bodyCardImageUrls: [
        'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
      bodyCardDescriptions: ['Elemento 1.', 'Elemento 2.'],
      bodyCardOnSeeMore: [
        () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Ver más de card 1')));
        },
        () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Ver más de card 2')));
        },
      ],
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
      footerBackgroundColor: Color(0xFFEEEEEE),
    );
  }
}
