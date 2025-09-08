import 'package:flutter/material.dart';
import '../organisms/organism.dart';

class SearchResultsPage extends StatefulWidget {
  // Header
  final String headerUserName;
  final String headerUserImageUrl;
  final List<String> headerLabelButtons;
  final List<VoidCallback> headerActionsButtons;
  final double headerPaddingHorizontal;
  final double headerPaddingVertical;
  final String headerHintText;

  // Body (Cards)
  final List<String> bodyCardImageUrls;
  final List<String> bodyCardDescriptions;
  final List<VoidCallback?> bodyCardOnSeeMore;

  // Footer
  final String footerCopyright;
  final List<IconData> footerIcons;
  final List<String> footerLabels;
  final List<VoidCallback> footerActions;
  final Color footerBackgroundColor;
  final double footerPaddingHorizontal;
  final double footerPaddingVertical;

  const SearchResultsPage({
    super.key,
    // Header
    required this.headerUserName,
    required this.headerUserImageUrl,
    this.headerLabelButtons = const ['Inicio', 'Perfil', 'Configuración'],
    this.headerActionsButtons = const [],
    this.headerPaddingHorizontal = 20,
    this.headerPaddingVertical = 16,
    this.headerHintText = 'Buscar',
    // Body
    required this.bodyCardImageUrls,
    required this.bodyCardDescriptions,
    required this.bodyCardOnSeeMore,
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
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
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
    return Scaffold(
      body: Column(
        children: [
          OrganismHeader(
            imageUrl: widget.headerUserImageUrl,
            userName: widget.headerUserName,
            paddingHorizontal: widget.headerPaddingHorizontal,
            paddingVertical: widget.headerPaddingVertical,
            searchController: _searchController,
            hintText: widget.headerHintText
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: OrganismListCard(
                    imageUrls: widget.bodyCardImageUrls,
                    descriptions: widget.bodyCardDescriptions,
                    onSeeMoreCallbacks: widget.bodyCardOnSeeMore,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          OrganismFooter(
            copyright: widget.footerCopyright,
            icons: widget.footerIcons,
            labels: widget.footerLabels,
            actions: widget.footerActions,
            backgroundColor: widget.footerBackgroundColor,
            paddingHorizontal: widget.footerPaddingHorizontal,
            paddingVertical: widget.footerPaddingVertical,
          ),
        ],
      ),
    );
  }
}
