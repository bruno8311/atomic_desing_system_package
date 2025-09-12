import 'package:flutter/material.dart';
import '../templates/template_detail_page.dart';

class PageDetail extends StatelessWidget {
  const PageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateDetailPage(
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
        ).showSnackBar(SnackBar(content: Text('Logout')));
      },
      productImageUrl:'https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?q=80&w=1170&auto=format&fit=crop',
      productTitle: 'producto de prueba',
      productPrice: 'S/ 9.99',
      productCategory: 'jewelery',
      productDescription:'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...',
      buttonLabel: 'Añadir',
      onButtonPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Agregado al carrito')));
      },
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
