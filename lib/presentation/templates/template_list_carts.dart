import 'package:flutter/material.dart';
import '../organisms/organism.dart';
import 'template_base_page.dart';

class TemplateListCarts extends StatelessWidget {
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
  final TextEditingController? headerSearchController;

  // Body (Cards)
  final List<String> bodyCardImageUrls;
  final List<String> bodyCardDescriptions;
  final List<VoidCallback?> bodyCardOnSeeMore;
  final Widget? bodyWhenEmpty;

  // Footer
  final String footerCopyright;
  final List<IconData> footerIcons;
  final List<String> footerLabels;
  final List<VoidCallback> footerActions;
  final Color footerBackgroundColor;
  final double footerPaddingHorizontal;
  final double footerPaddingVertical;

  const TemplateListCarts({
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
    this.headerSearchController,

    // Body
    required this.bodyCardImageUrls,
    required this.bodyCardDescriptions,
    required this.bodyCardOnSeeMore,
    this.bodyWhenEmpty,

    // Footer
    this.footerCopyright = '© 2025 Mi Empresa. Todos los derechos reservados.',
    required this.footerIcons,
    this.footerLabels = const [],
    this.footerActions = const [],
    this.footerBackgroundColor = const Color(0xFFEEEEEE),
    this.footerPaddingHorizontal = 20,
    this.footerPaddingVertical = 16,
  }) : assert(
         bodyCardImageUrls.length == bodyCardDescriptions.length &&
             bodyCardDescriptions.length == bodyCardOnSeeMore.length,
         'Todas las listas deben tener el mismo tamaño',
       );

  @override
  Widget build(BuildContext context) {
    final headerWidget = OrganismHeaderSearchBox(
      title: headerTitle,
      imageUrl: headerUserImageUrl,
      userName: headerUserName,
      paddingHorizontal: headerPaddingHorizontal,
      paddingVertical: headerPaddingVertical,
      searchController: headerSearchController,
      hintText: headerHintText,
      showBackArrow: headerShowBackArrow,
      onSearch: headerOnSearch,
      userNameFontSize: headerUserNameFontSize,
      avatarRadius: headerAvatarRadius,
      onLogout: headerOnLogout,
      onHome: headerOnHome,
    );

    final footerWidget = OrganismFooter(
      copyright: footerCopyright,
      icons: footerIcons,
      labels: footerLabels,
      actions: footerActions,
      backgroundColor: footerBackgroundColor,
      paddingHorizontal: footerPaddingHorizontal,
      paddingVertical: footerPaddingVertical,
    );

    return TemplateBasePage(
      header: headerWidget,
      footer: footerWidget,
      imageUrls: bodyCardImageUrls,
      descriptions: bodyCardDescriptions,
      onSeeMoreCallbacks: bodyCardOnSeeMore,
      isList: true,
    );
  }
}