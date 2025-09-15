import 'package:flutter/material.dart';
import '../organisms/organism.dart';
import 'template_base_page.dart';

class TemplateContactPage extends StatelessWidget {
  // Header
  final String headerUserImageUrl;
  final String headerUserName;
  final String headerTitle;
  final bool headerShowBackArrow;
  final VoidCallback headerOnLogout;
  final VoidCallback headerOnHome;

  // Footer
  final String footerCopyright;
  final List<IconData> footerIcons;
  final List<String> footerLabels;
  final List<VoidCallback> footerActions;
  final Color footerBackgroundColor;
  final double footerPaddingHorizontal;
  final double footerPaddingVertical;

  // Descriptivo
  final String? descriptiveTitle;
  final String? descriptiveSubtitle;
  final String? descriptiveImageUrl;
  final String? descriptiveTextFieldHint;
  final String? descriptiveButtonText;
  final bool descriptiveButtonDependsOnText;
  final void Function(String text)? descriptiveOnButtonPressed;

  const TemplateContactPage({
    super.key,
    // Header
    required this.headerUserImageUrl,
    required this.headerUserName,
    required this.headerTitle,
    this.headerShowBackArrow = true,
    required this.headerOnLogout,
    required this.headerOnHome,
    // Footer
    this.footerCopyright = '© 2025 Mi Empresa. Todos los derechos reservados.',
    required this.footerIcons,
    this.footerLabels = const [],
    this.footerActions = const [],
    this.footerBackgroundColor = const Color(0xFFEEEEEE),
    this.footerPaddingHorizontal = 20,
    this.footerPaddingVertical = 16,
    // Descriptivo
    this.descriptiveTitle,
    this.descriptiveSubtitle,
    this.descriptiveImageUrl,
    this.descriptiveTextFieldHint = 'Escribe aquí...',
    this.descriptiveButtonText = 'Aceptar',
    this.descriptiveButtonDependsOnText = false,
    this.descriptiveOnButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final header = OrganismHeaderWithoutSearch(
      imageUrl: headerUserImageUrl,
      userName: headerUserName,
      title: headerTitle,
      showBackArrow: headerShowBackArrow,
      onLogout: headerOnLogout,
      onHome: headerOnHome,
    );

    final footer = OrganismFooter(
      copyright: footerCopyright,
      icons: footerIcons,
      labels: footerLabels,
      actions: footerActions,
      backgroundColor: footerBackgroundColor,
      paddingHorizontal: footerPaddingHorizontal,
      paddingVertical: footerPaddingVertical,
    );

    return TemplateBasePage(
      header: header,
      footer: footer,
      descriptiveTitle: descriptiveTitle,
      descriptiveSubtitle: descriptiveSubtitle,
      descriptiveImageUrl: descriptiveImageUrl,
      descriptiveTextFieldHint: descriptiveTextFieldHint,
      descriptiveButtonText: descriptiveButtonText,
      descriptiveButtonDependsOnText: descriptiveButtonDependsOnText,
      descriptiveOnButtonPressed: descriptiveOnButtonPressed,
      isList: false,
    );
  }
}
