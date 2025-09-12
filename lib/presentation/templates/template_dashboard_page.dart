import 'package:flutter/material.dart';
import '../organisms/organism.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'template_base_page.dart';

class TemplateDashboardPage extends StatefulWidget {
  // Header
  final String headerUserName;
  final String headerUserImageUrl;
  final double headerPaddingHorizontal;
  final double headerPaddingVertical;
  final String headerHintText;
  final String headerTitle;
  final bool headerShowBackArrow;
  final ValueChanged<String>? headerOnSearch;
  final VoidCallback headerOnLogout;
  final VoidCallback headerOnHome;
  final double headerUserNameFontSize;
  final double headerAvatarRadius;

  // Body (Carousels)
  final List<String> bodyCarouselsTitles;
  final List<List<String>> bodyCarouselsImageUrls;
  final List<List<String>> bodyCarouselsDescriptions;
  final List<List<VoidCallback?>> bodyCarouselsOnSeeMore;
  final String? bodyCardHeaderTitle;
  final List<IconData> bodyCardIcons;
  final List<String> bodyCardTitles;
  final List<String> bodyCardSubtitles;
  final List<VoidCallback> bodyCardOnTaps;

  // Footer
  final String footerCopyright;
  final List<IconData> footerIcons;
  final List<String> footerLabels;
  final List<VoidCallback> footerActions;
  final Color footerBackgroundColor;
  final double footerPaddingHorizontal;
  final double footerPaddingVertical;

  const TemplateDashboardPage({
    super.key,
    // Header
    required this.headerUserName,
    required this.headerUserImageUrl,
    required this.headerOnLogout,
    required this.headerOnHome,
    this.headerPaddingHorizontal = 12,
    this.headerPaddingVertical = 12,
    this.headerHintText = 'Buscar',
    required this.headerTitle,
    this.headerShowBackArrow = false,
    this.headerOnSearch,
    this.headerUserNameFontSize = 14,
    this.headerAvatarRadius = 20,

    // Body
    this.bodyCardHeaderTitle,
    required this.bodyCardIcons,
    required this.bodyCardTitles,
    required this.bodyCardSubtitles,
    required this.bodyCardOnTaps,
    required this.bodyCarouselsTitles,
    required this.bodyCarouselsImageUrls,
    required this.bodyCarouselsDescriptions,
    required this.bodyCarouselsOnSeeMore,

    // Footer
    this.footerCopyright = '© 2025 Mi Tienda. Todos los derechos reservados.',
    required this.footerIcons,
    this.footerLabels = const [],
    this.footerActions = const [],
    this.footerBackgroundColor = AppColors.background,
    this.footerPaddingHorizontal = 20,
    this.footerPaddingVertical = 16,
  }) : assert(
         bodyCardIcons.length == bodyCardTitles.length &&
             bodyCardTitles.length == bodyCardSubtitles.length &&
             bodyCardSubtitles.length == bodyCardOnTaps.length,
         'Las listas de íconos, títulos, subtítulos y onTaps de las cards deben tener el mismo tamaño.',
       ),
       assert(
         bodyCarouselsTitles.length == bodyCarouselsImageUrls.length &&
             bodyCarouselsImageUrls.length ==
                 bodyCarouselsDescriptions.length &&
             bodyCarouselsDescriptions.length == bodyCarouselsOnSeeMore.length,
         'Las listas de carouseles (títulos, imágenes, descripciones y onSeeMore) deben tener el mismo tamaño.',
       );

  @override
  State<TemplateDashboardPage> createState() => _TemplateDashboardPageState();
}

class _TemplateDashboardPageState extends State<TemplateDashboardPage> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = OrganismHeaderSearchBox(
      title: widget.headerTitle,
      imageUrl: widget.headerUserImageUrl,
      userName: widget.headerUserName,
      paddingHorizontal: widget.headerPaddingHorizontal,
      paddingVertical: widget.headerPaddingVertical,
      searchController: _searchController,
      hintText: widget.headerHintText,
      showBackArrow: widget.headerShowBackArrow,
      onSearch: widget.headerOnSearch,
      userNameFontSize: widget.headerUserNameFontSize,
      avatarRadius: widget.headerAvatarRadius,
      onLogout: widget.headerOnLogout,
      onHome: widget.headerOnHome,
    );

    final footer = OrganismFooter(
      copyright: widget.footerCopyright,
      icons: widget.footerIcons,
      labels: widget.footerLabels,
      actions: widget.footerActions,
      backgroundColor: widget.footerBackgroundColor,
      paddingHorizontal: widget.footerPaddingHorizontal,
      paddingVertical: widget.footerPaddingVertical,
    );

    final body = ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: OrganismListIconCard(
            headerTitle: widget.bodyCardHeaderTitle,
            icons: widget.bodyCardIcons,
            titles: widget.bodyCardTitles,
            subtitles: widget.bodyCardSubtitles,
            onTaps: widget.bodyCardOnTaps,
          ),
        ),
        const SizedBox(height: 12),
        for (int i = 0; i < widget.bodyCarouselsTitles.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OrganismCarousel(
              title: widget.bodyCarouselsTitles[i],
              imageUrls: widget.bodyCarouselsImageUrls[i],
              descriptions: widget.bodyCarouselsDescriptions[i],
              onSeeMoreCallbacks: widget.bodyCarouselsOnSeeMore[i],
            ),
          ),
        const SizedBox(height: 24),
      ],
    );

    return TemplateBasePage(header: header, footer: footer, body: body);
  }
}
