import 'package:flutter/material.dart';
import '../templates/template_dashboard_page.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateDashboardPage(
      headerUserName: 'Bruno Salazar',
      headerUserImageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop',
      headerShowBackArrow: true,
      bodyCardHeaderTitle: 'Favoritos',
      bodyCardIcons: const [
        Icons.star,
        Icons.star,
      ],
      bodyCardTitles: const [
        'Favoritos 1',
        'Favoritos 2',
      ],
      bodyCardSubtitles: const [
        'Tus elementos favoritos 1',
        'Tus elementos favoritos 2',
      ],
      bodyCardOnTaps: [
        () {},
        () {},
      ],
      bodyCarouselsTitles: const [
        'Promociones',
        'Novedades',
      ],
      bodyCarouselsImageUrls: const [
        [
          'https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?q=80&w=1170&auto=format&fit=crop',
          'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop',
        ],
        [
          'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop',
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop',
        ],
      ],
      bodyCarouselsDescriptions: const [
        [
          'Promo especial 1',
          'Promo especial 2',
        ],
        [
          'Novedad 1',
          'Novedad 2',
        ],
      ],
      bodyCarouselsOnSeeMore: [
        [() {}, () {}],
        [() {}, () {}],
      ],
      footerIcons: const [
        Icons.facebook,
        Icons.email,
      ],
      footerLabels: const ['Contacto', 'Ayuda'],
      footerActions: [
        () {},
        () {},
      ],
    );
  }
}
