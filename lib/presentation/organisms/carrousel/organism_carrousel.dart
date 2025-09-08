import '../../atoms/atoms.dart';
import '../../molecules/molecules.dart';
import 'package:flutter/material.dart';


class OrganismCarousel extends StatelessWidget {
  final String title;
  final List<String> imageUrls;
  final List<String> descriptions;
  final List<VoidCallback?> onSeeMoreCallbacks;
  final double height;
  final EdgeInsetsGeometry? padding;

  const OrganismCarousel({
    super.key,
    required this.title,
    required this.imageUrls,
    required this.descriptions,
    required this.onSeeMoreCallbacks,
    this.height = 300,
    this.padding,
  }) : assert(imageUrls.length == descriptions.length && descriptions.length == onSeeMoreCallbacks.length, 'Todas las listas deben tener el mismo tamaño');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AtomText(
          text: title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: height,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.85),
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              // Calcula el alto de la imagen y otros elementos proporcionalmente
              final imageHeight = height * 0.45; // 50% para la imagen
              final descriptionFontSize = height * 0.045;
              final buttonFontSize = height * 0.05;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MoleculeCard(
                  imageUrl: imageUrls[index],
                  description: descriptions[index],
                  onSeeMore: onSeeMoreCallbacks[index],
                  imageHeight: imageHeight,
                  buttonTextStyle: TextStyle(fontSize: buttonFontSize),
                  descriptionTextStyle: TextStyle(fontSize: descriptionFontSize),
                  maxLinesDescription: 2,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}