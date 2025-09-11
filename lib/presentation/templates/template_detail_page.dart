import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/presentation/organisms/headers/organism_header3.dart';
import 'package:atomic_desing_system_package/presentation/atoms/atoms.dart';
import 'package:atomic_desing_system_package/core/constants/app_colors.dart';
import 'package:atomic_desing_system_package/core/constants/app_text_styles.dart';
import 'package:atomic_desing_system_package/presentation/organisms/footer/organism_footer.dart';

class TemplateDetailPage extends StatefulWidget {
	// Header
	final String headerImageUrl;
	final String headerUserName;
	final String headerTitle;
	final bool headerShowBackArrow;
  final VoidCallback headerOnLogout;
  final VoidCallback headerOnHome;

	// Body
	final String productImageUrl;
	final String productTitle;
	final String productPrice;
	final String productCategory;
	final String productDescription;
	final String buttonLabel;
	final VoidCallback? onButtonPressed;

	// Footer
	final String footerCopyright;
	final List<IconData> footerIcons;
	final List<String> footerLabels;
	final List<VoidCallback> footerActions;
	final Color footerBackgroundColor;
	final double footerPaddingHorizontal;
	final double footerPaddingVertical;

	const TemplateDetailPage({
		super.key,
		// Header
		required this.headerImageUrl,
		required this.headerUserName,
		required this.headerTitle,
		this.headerShowBackArrow = true,
    required this.headerOnLogout,
    required this.headerOnHome,
		// Body
		required this.productImageUrl,
		required this.productTitle,
		required this.productPrice,
		required this.productCategory,
		required this.productDescription,
		this.buttonLabel = 'Agregar al carrito',
		this.onButtonPressed,
		// Footer
		this.footerCopyright = '© 2025 Mi Empresa. Todos los derechos reservados.',
		required this.footerIcons,
		this.footerLabels = const [],
		this.footerActions = const [],
		this.footerBackgroundColor = const Color(0xFFEEEEEE),
		this.footerPaddingHorizontal = 20,
		this.footerPaddingVertical = 16,
	});

	@override
	State<TemplateDetailPage> createState() => _TemplateDetailPageState();
}

class _TemplateDetailPageState extends State<TemplateDetailPage> {

	@override
		@override
			Widget build(BuildContext context) {
				return Scaffold(
					backgroundColor: AppColors.background,
					body: Column(
						children: [
							OrganismHeader3(
								imageUrl: widget.headerImageUrl,
								userName: widget.headerUserName,
								title: widget.headerTitle,
								showBackArrow: widget.headerShowBackArrow,
                onLogout: widget.headerOnLogout,
                onHome: widget.headerOnHome
							),
							Expanded(
								child: SingleChildScrollView(
									child: Padding(
										padding: const EdgeInsets.symmetric(horizontal: 24.0),
										child: Column(
											crossAxisAlignment: CrossAxisAlignment.center,
											children: [
												const SizedBox(height: 24),
												AtomImg(
													imageUrl: widget.productImageUrl,
													height: 180,
													width: 180,
													fit: BoxFit.cover,
													borderRadius: BorderRadius.circular(16),
												),
												const SizedBox(height: 24),
												AtomLabel(
													text: widget.productTitle,
													style: AppTextStyles.headline,
												),
												const SizedBox(height: 8),
												AtomLabel(
													text: widget.productPrice,
													style: AppTextStyles.subtitle.copyWith(color: AppColors.primary),
												),
												const SizedBox(height: 12),
												  AtomChip(label: widget.productCategory),
												const SizedBox(height: 16),
												AtomText(
													text: widget.productDescription,
													style: AppTextStyles.body,
													textAlign: TextAlign.center,
													maxLines: 5,
													overflow: TextOverflow.ellipsis,
												),
												const SizedBox(height: 32),
												AtomButton(
													label: widget.buttonLabel,
													onPressed: widget.onButtonPressed,
													borderRadius: 24,
													padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
													textStyle: AppTextStyles.button.copyWith(fontSize: 16),
												),
												const SizedBox(height: 24),
											],
										),
									),
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

