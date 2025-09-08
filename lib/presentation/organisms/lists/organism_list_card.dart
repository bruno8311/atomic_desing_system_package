import 'package:flutter/material.dart';
import '../../molecules/cards/molecl_card.dart';

class OrganismListCard extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> descriptions;
  final List<VoidCallback?> onSeeMoreCallbacks;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const OrganismListCard({
    super.key,
    required this.imageUrls,
    required this.descriptions,
    required this.onSeeMoreCallbacks,
    this.padding,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
  }) : assert(imageUrls.length == descriptions.length && descriptions.length == onSeeMoreCallbacks.length, 'Todas las listas deben tener el mismo tamaño');

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding ?? const EdgeInsets.all(16),
      itemCount: imageUrls.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return MoleculeCard(
          imageUrl: imageUrls[index],
          description: descriptions[index],
          onSeeMore: onSeeMoreCallbacks[index],
        );
      },
      shrinkWrap: shrinkWrap,
      physics: physics,
    );
  }
}