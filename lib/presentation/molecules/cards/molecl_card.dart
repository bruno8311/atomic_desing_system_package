import 'package:flutter/material.dart';
import '../../atoms/atoms.dart';

class MoleculeCard extends StatelessWidget {
  final String imageUrl;
  final String description;
  final VoidCallback? onSeeMore;
  final double imageHeight;
  final double imageRadius;
  final EdgeInsetsGeometry? padding;

  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry? buttonPadding;
  final TextStyle? descriptionTextStyle;
  final int? maxLinesDescription;
  const MoleculeCard({
    super.key,
    required this.imageUrl,
    required this.description,
    this.onSeeMore,
    this.imageHeight = 160,
    this.imageRadius = 16,
    this.padding,
    this.buttonTextStyle,
    this.buttonPadding,
    this.descriptionTextStyle,
    this.maxLinesDescription,
  });

@override
Widget build(BuildContext context) {
  return AtomCard(
    child: Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AtomImg(
            imageUrl: imageUrl,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(imageRadius),
          ),
          const SizedBox(height: 12),
          AtomText(
            text: description,
            style: descriptionTextStyle ?? Theme.of(context).textTheme.bodyLarge,
            maxLines: maxLinesDescription,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AtomButton(
                label: 'Ver más',
                onPressed: onSeeMore,
                textStyle: buttonTextStyle,
                padding: buttonPadding,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}
